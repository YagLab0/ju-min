/**
 * scrape-capmin.ts — extrae proveedores del directorio CAPMIN
 * (https://www.capmin.com.ar/directorio-proveedores-mineros/) y genera:
 *
 *   supabase/seed-data/capmin.csv               → dataset crudo
 *   supabase/seed-data/proveedores-capmin.sql   → INSERTs idempotentes para seed.sql
 *
 * Sin dependencias externas (Node 24 corre .ts nativo):
 *   node scripts/scrape-capmin.ts
 *
 * "Cumplen requisitos": para cada proveedor cuyas categorías tienen requisitos
 * obligatorios en `requisitos_categoria`, se sintetizan
 * `proveedor_certificaciones` verificadas → cumple_requisitos() = true y la
 * red verificada los ve (estado 'validado'). El resto queda 'registrado'.
 */

import { writeFileSync, mkdirSync } from "node:fs";

const BASE = "https://www.capmin.com.ar";
const LIST_URL = `${BASE}/directorio-proveedores-mineros/`;
const OUT_DIR = "supabase/seed-data";
const PER_PAGE = 36;

type Proveedor = {
  nombre: string;
  urlDetalle: string;
  domicilio: string | null;
  localidad: string | null;
  provincia: string | null;
  sitioWeb: string | null;
  rating: number;
  reviews: number;
  categorias: { slug: string; nombre: string }[];
};

const PROVINCIAS_AR = new Set([
  "Buenos Aires", "CABA", "Catamarca", "Chaco", "Chubut", "Córdoba", "Corrientes",
  "Entre Ríos", "Formosa", "Jujuy", "La Pampa", "La Rioja", "Mendoza", "Misiones",
  "Neuquén", "Río Negro", "Salta", "San Juan", "San Luis", "Santa Cruz",
  "Santa Fe", "Santiago del Estero", "Tierra del Fuego", "Tucumán",
]);

const decodeEntities = (s: string) =>
  s.replace(/&#0?39;|&#x27;/g, "'").replace(/&amp;/g, "&").replace(/&quot;/g, '"')
   .replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&#8211;|&ndash;/g, "–")
   .replace(/&#8217;|&rsquo;/g, "’").replace(/&#8220;|&ldquo;|&#8221;|&rdquo;/g, '"')
   .replace(/&eacute;/g, "é").replace(/&iacute;/g, "í").replace(/&oacute;/g, "ó")
   .replace(/&aacute;/g, "á").replace(/&uacute;/g, "ú").replace(/&ntilde;/g, "ñ")
   .trim();

const sqlStr = (s: string | null) =>
  s === null ? "null" : `'${s.replace(/'/g, "''")}'`;

function parseCard(card: string): Proveedor | null {
  const title = card.match(
    /directorist-listing-title"><a href="([^"]+)"[^>]*>([^<]+)<\/a>/
  );
  if (!title) return null;

  const address = card.match(
    /directorist-listing-card-address"><i[^>]*><\/i>\s*([^<]+)/
  );
  const website = card.match(
    /directorist-listing-card-website">\s*<i[^>]*><\/i>\s*<a[^>]*href="([^"]+)"/
  );
  const rating = card.match(/directorist-rating-avg">\s*([\d.]+)/);
  const reviews = card.match(/directorist-total-review">\s*\((\d+)\)/);

  const catBlock = card.match(
    /directorist-listing-category">([\s\S]*?)(?:<\/footer>|<\/div>\s*<\/div>\s*<\/footer>)/
  );
  const categorias: Proveedor["categorias"] = [];
  const catRe = /categoria-unica\/([^/"?]+)\/[^>]*>(?:<i[^>]*><\/i>)?\s*([^<]+)<\/a>/g;
  const catSrc = catBlock ? catBlock[1] : card.slice(card.indexOf("directorist-listing-category"));
  let cm: RegExpExecArray | null;
  while ((cm = catRe.exec(catSrc))) {
    const nombre = decodeEntities(cm[2]);
    if (!categorias.some((c) => c.slug === cm![1])) {
      categorias.push({ slug: cm[1], nombre });
    }
  }

  // dirección → provincia/localidad (último token = provincia si es válida)
  let domicilio: string | null = null;
  let localidad: string | null = null;
  let provincia: string | null = null;
  if (address) {
    const raw = decodeEntities(address[1]);
    const parts = raw.split(",").map((p) => p.trim()).filter(Boolean);
    const last = parts[parts.length - 1] ?? "";
    if (PROVINCIAS_AR.has(last) || /^CABA|Ciudad Autónoma/i.test(last)) {
      provincia = /CABA|Ciudad Autónoma/i.test(last) ? "CABA" : last;
      localidad = parts.length > 1 ? parts[parts.length - 2] : null;
      domicilio = parts.slice(0, -2).join(", ") || null;
    } else {
      domicilio = raw;
    }
  }

  return {
    nombre: decodeEntities(title[2]),
    urlDetalle: title[1],
    domicilio,
    localidad,
    provincia,
    sitioWeb: website ? website[1].trim() : null,
    rating: rating ? parseFloat(rating[1]) : 0,
    reviews: reviews ? parseInt(reviews[1], 10) : 0,
    categorias,
  };
}

async function fetchPage(n: number): Promise<string> {
  const url = n === 1 ? LIST_URL : `${LIST_URL}page/${n}/`;
  const res = await fetch(url, {
    headers: { "user-agent": "ju-min-scraper/1.0 (hackathon demo)" },
  });
  if (!res.ok) throw new Error(`HTTP ${res.status} en ${url}`);
  return res.text();
}

function cards(html: string): string[] {
  return html
    .split(/directorist-listing-single directorist-listing-single--bg/)
    .slice(1);
}

const all: Proveedor[] = [];
const vistos = new Set<string>();

const firstHtml = await fetchPage(1);
const pages = Math.max(
  1,
  ...[...firstHtml.matchAll(/directorio-proveedores-mineros\/page\/(\d+)\//g)].map(
    (m) => parseInt(m[1], 10)
  )
);
console.log(`páginas detectadas: ${pages}`);

for (let n = 1; n <= pages; n++) {
  const html = n === 1 ? firstHtml : await fetchPage(n);
  const found = cards(html).map(parseCard).filter((p): p is Proveedor => !!p);
  for (const p of found) {
    if (!vistos.has(p.urlDetalle)) {
      vistos.add(p.urlDetalle);
      all.push(p);
    }
  }
  console.log(`página ${n}: ${found.length} tarjetas (total único: ${all.length})`);
  await new Promise((r) => setTimeout(r, 400)); // cortesía
}

mkdirSync(OUT_DIR, { recursive: true });

// ---------- CSV ----------
const header = "nombre;domicilio;localidad;provincia;sitio_web;rating;reviews;categorias;url_detalle";
const lines = all.map((p) =>
  [
    p.nombre, p.domicilio ?? "", p.localidad ?? "", p.provincia ?? "",
    p.sitioWeb ?? "", p.rating, p.reviews,
    p.categorias.map((c) => c.nombre).join("|"), p.urlDetalle,
  ].join(";")
);
writeFileSync(`${OUT_DIR}/capmin.csv`, [header, ...lines].join("\n") + "\n");

// ---------- SQL ----------
const sql: string[] = [
  "-- Generado por scripts/scrape-capmin.ts — no editar a mano",
  `-- ${all.length} proveedores del directorio CAPMIN`,
  "",
  "-- Categorías nuevas del directorio (las que no estén ya sembradas)",
];

const catSet = new Map<string, string>();
for (const p of all) for (const c of p.categorias) catSet.set(c.slug, c.nombre);
for (const [slug, nombre] of [...catSet].sort()) {
  sql.push(
    `insert into categorias (nombre, slug, origen)\n` +
    `select ${sqlStr(nombre)}, ${sqlStr(slug)}, 'capmin'\n` +
    `where not exists (select 1 from categorias where slug = ${sqlStr(slug)} or nombre = ${sqlStr(nombre)});`
  );
}

sql.push("", "-- Proveedores (dedup por razón social)");
for (const p of all) {
  const slugs = p.categorias.map((c) => c.slug);
  sql.push(`
insert into proveedores
  (razon_social, domicilio, localidad, provincia, sitio_web, estado, fuente, fuente_url)
select ${sqlStr(p.nombre)}, ${sqlStr(p.domicilio)}, ${sqlStr(p.localidad)},
       ${sqlStr(p.provincia)}, ${sqlStr(p.sitioWeb)},
       case when exists (
         select 1 from categorias c
         join requisitos_categoria rc
           on rc.categoria_id = c.id and rc.obligatorio
         where c.slug = any(array[${slugs.map(sqlStr).join(",")}]::text[])
       ) then 'validado'::estado_proveedor else 'registrado'::estado_proveedor end,
       'capmin', ${sqlStr(p.urlDetalle)}
where not exists (
  select 1 from proveedores x where upper(x.razon_social) = upper(${sqlStr(p.nombre)})
);

insert into proveedor_categorias (proveedor_id, categoria_id)
select p.id, c.id
from proveedores p, categorias c
where upper(p.razon_social) = upper(${sqlStr(p.nombre)})
  and c.slug = any(array[${slugs.map(sqlStr).join(",")}]::text[])
on conflict do nothing;

-- Certificados sintetizados: el proveedor cumple los requisitos obligatorios
-- de sus categorías (evidencia simulada, estado 'verificado')
insert into proveedor_certificaciones
  (proveedor_id, certificacion_id, organismo, fecha_emision, fecha_vencimiento, estado)
select distinct p.id, rc.certificacion_id, 'IRAM', date '2024-03-15', date '2027-03-15', 'verificado'::estado_verificacion
from proveedores p
join proveedor_categorias pk on pk.proveedor_id = p.id
join requisitos_categoria rc
  on rc.categoria_id = pk.categoria_id and rc.obligatorio
where upper(p.razon_social) = upper(${sqlStr(p.nombre)})
  and not exists (
    select 1 from proveedor_certificaciones x
    where x.proveedor_id = p.id and x.certificacion_id = rc.certificacion_id
  );`);
}

writeFileSync(`${OUT_DIR}/proveedores-capmin.sql`, sql.join("\n") + "\n");

console.log(`\nOK — ${all.length} proveedores, ${catSet.size} categorías`);
console.log(`→ ${OUT_DIR}/capmin.csv`);
console.log(`→ ${OUT_DIR}/proveedores-capmin.sql (se incluye desde seed.sql con \\ir)`);
