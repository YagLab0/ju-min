// PDF del informe de recomendación: el documento que la minera adjunta a su
// orden de compra. Se arma con pdf-lib (sin dependencias nativas) y las
// fuentes estándar Helvetica, que cubren los acentos y la ñ del español.

import "server-only";

import { PDFDocument, StandardFonts, rgb, type PDFFont, type PDFPage } from "pdf-lib";

import type { Informe } from "@/lib/compras";

const A4: [number, number] = [595.28, 841.89];
const MARGEN = 48;
const ANCHO = A4[0] - MARGEN * 2;

// Paleta del proyecto (slide-deck / landing).
const TINTA = rgb(0x29 / 255, 0x24 / 255, 0x1c / 255);
const PIEDRA = rgb(0x6f / 255, 0x67 / 255, 0x5b / 255);
const LINEA = rgb(0xe7 / 255, 0xe2 / 255, 0xd6 / 255);
const SENAL = rgb(0xf5 / 255, 0xb3 / 255, 0x01 / 255);
const PAPEL = rgb(0xf8 / 255, 0xf6 / 255, 0xf1 / 255);

interface Lienzo {
  doc: PDFDocument;
  pagina: PDFPage;
  y: number;
  normal: PDFFont;
  negrita: PDFFont;
}

/** Genera el PDF del informe. `urlVerificacion` es la dirección pública
 * donde un auditor confirma el código. */
export async function renderizarInformePdf(
  informe: Informe,
  urlVerificacion: string,
): Promise<Uint8Array> {
  const doc = await PDFDocument.create();
  doc.setTitle(`Informe de recomendación ${informe.codigo}`);
  doc.setAuthor("ju-min");
  doc.setSubject(informe.contenido.insumo.nombre);
  doc.setCreationDate(new Date(informe.creadoEn));
  doc.setModificationDate(new Date(informe.creadoEn));

  const l: Lienzo = {
    doc,
    pagina: doc.addPage(A4),
    y: A4[1] - MARGEN,
    normal: await doc.embedFont(StandardFonts.Helvetica),
    negrita: await doc.embedFont(StandardFonts.HelveticaBold),
  };
  const c = informe.contenido;

  // Encabezado
  l.pagina.drawRectangle({ x: 0, y: A4[1] - 6, width: A4[0], height: 6, color: SENAL });
  texto(l, "ju-min · Informe de recomendación", 18, l.negrita);
  texto(l, c.minera, 11, l.normal, PIEDRA);
  l.y -= 6;
  filaDatos(l, [
    ["Código", informe.codigo],
    ["Fecha", formatoFecha(informe.creadoEn)],
    ["Generado por", `${informe.generadoPor.nombre} (${informe.generadoPor.email})`],
  ]);

  // Insumo
  seccion(l, "Insumo");
  texto(l, c.insumo.nombre, 12, l.negrita);
  if (c.insumo.especificacion) parrafo(l, c.insumo.especificacion, 10, PIEDRA);
  if (c.stock) {
    const dias = c.stock.diasRestantes === null ? "" : ` · alcanza para unos ${c.stock.diasRestantes} días`;
    parrafo(
      l,
      `Stock actual: ${numero(c.stock.cantidadActual)} ${c.insumo.unidad} · punto de reorden: ${numero(c.stock.puntoReorden)} ${c.insumo.unidad}${dias}`,
      10,
    );
  }
  if (c.requisitos.length > 0) {
    parrafo(l, `Requisitos obligatorios de la categoría: ${c.requisitos.join(", ")}`, 10);
  }

  // Recomendación
  seccion(l, "Proveedor recomendado");
  const altoCaja = 54;
  asegurarEspacio(l, altoCaja + 8);
  l.pagina.drawRectangle({
    x: MARGEN,
    y: l.y - altoCaja,
    width: ANCHO,
    height: altoCaja,
    color: PAPEL,
    borderColor: LINEA,
    borderWidth: 1,
  });
  l.pagina.drawRectangle({ x: MARGEN, y: l.y - altoCaja, width: 4, height: altoCaja, color: SENAL });
  l.y -= 8;
  texto(l, c.proveedor.razonSocial + (c.proveedor.cuit ? `  ·  CUIT ${c.proveedor.cuit}` : ""), 12, l.negrita, TINTA, 14);
  texto(
    l,
    `Precio: ${moneda(c.oferta.precio, c.oferta.moneda)}   ·   Plazo de entrega: ${plazo(c.oferta.leadTimeDias)}   ·   Trust score: ${Math.round(c.proveedor.trustScore)}/100`,
    10,
    l.normal,
    TINTA,
    14,
  );
  l.y -= 12;
  texto(l, "Por qué", 10, l.negrita);
  parrafo(l, c.justificacion, 10);

  // Alternativas y descartados
  seccion(l, `Otras ofertas que cumplen (${c.alternativas.length})`);
  if (c.alternativas.length === 0) parrafo(l, "Ninguna.", 10, PIEDRA);
  for (const a of c.alternativas) {
    parrafo(
      l,
      `• ${a.proveedor}: ${moneda(a.precio, a.moneda)} · ${plazo(a.leadTimeDias)} · trust score ${Math.round(a.trustScore)}/100`,
      10,
    );
  }
  seccion(l, `Ofertas descartadas (${c.descartados.length})`);
  if (c.descartados.length === 0) parrafo(l, "Ninguna.", 10, PIEDRA);
  for (const d of c.descartados) parrafo(l, `• ${d.proveedor}: ${d.motivo}`, 10);

  // Alcance y verificación
  seccion(l, "Alcance");
  parrafo(
    l,
    "ju-min recomienda; no aprueba, no compra ni paga. La aprobación, la compra, el pago y la recepción se hacen en el sistema de la minera. Los datos de este informe son los vigentes al momento de generarlo.",
    9,
    PIEDRA,
  );
  seccion(l, "Verificación");
  parrafo(l, `Para confirmar que este informe es auténtico, ingresá el código ${informe.codigo} en ${urlVerificacion}`, 9);
  parrafo(l, `Sello SHA-256: ${informe.sello}`, 7.5, PIEDRA);

  return doc.save();
}

// ---------- Dibujo ----------

function asegurarEspacio(l: Lienzo, alto: number): void {
  if (l.y - alto >= MARGEN) return;
  l.pagina = l.doc.addPage(A4);
  l.y = A4[1] - MARGEN;
}

function texto(
  l: Lienzo,
  contenido: string,
  tamano: number,
  fuente: PDFFont,
  color = TINTA,
  sangria = 0,
): void {
  asegurarEspacio(l, tamano * 1.4);
  l.y -= tamano * 1.15;
  l.pagina.drawText(seguro(contenido, fuente), { x: MARGEN + sangria, y: l.y, size: tamano, font: fuente, color });
  l.y -= tamano * 0.35;
}

/** Texto con salto de línea automático al ancho de la página. */
function parrafo(l: Lienzo, contenido: string, tamano: number, color = TINTA): void {
  for (const linea of partirLineas(seguro(contenido, l.normal), l.normal, tamano, ANCHO)) {
    texto(l, linea, tamano, l.normal, color);
  }
  l.y -= 2;
}

function seccion(l: Lienzo, titulo: string): void {
  asegurarEspacio(l, 40);
  l.y -= 14;
  l.pagina.drawLine({
    start: { x: MARGEN, y: l.y },
    end: { x: MARGEN + ANCHO, y: l.y },
    thickness: 0.8,
    color: LINEA,
  });
  l.y -= 4;
  texto(l, titulo.toUpperCase(), 9, l.negrita, PIEDRA);
  l.y -= 2;
}

function filaDatos(l: Lienzo, pares: [string, string][]): void {
  for (const [clave, valor] of pares) {
    asegurarEspacio(l, 16);
    l.y -= 12;
    l.pagina.drawText(clave, { x: MARGEN, y: l.y, size: 9, font: l.negrita, color: PIEDRA });
    l.pagina.drawText(seguro(valor, l.normal), { x: MARGEN + 90, y: l.y, size: 10, font: l.normal, color: TINTA });
    l.y -= 3;
  }
}

function partirLineas(contenido: string, fuente: PDFFont, tamano: number, ancho: number): string[] {
  const lineas: string[] = [];
  let actual = "";
  for (const palabra of contenido.split(/\s+/)) {
    const prueba = actual ? `${actual} ${palabra}` : palabra;
    if (fuente.widthOfTextAtSize(prueba, tamano) <= ancho || !actual) {
      actual = prueba;
    } else {
      lineas.push(actual);
      actual = palabra;
    }
  }
  if (actual) lineas.push(actual);
  return lineas;
}

/** Las fuentes estándar usan WinAnsi: se reemplazan los caracteres que no
 * entran (flechas, comillas tipográficas raras) para que el PDF no falle. */
function seguro(contenido: string, fuente: PDFFont): string {
  const reemplazos: Record<string, string> = { "→": "->", "≥": ">=", "≤": "<=", "−": "-" };
  const conjunto = new Set(fuente.getCharacterSet());
  return [...contenido]
    .map((ch) => reemplazos[ch] ?? (conjunto.has(ch.codePointAt(0) ?? 0) ? ch : "?"))
    .join("");
}

// ---------- Formato ----------

function formatoFecha(iso: string): string {
  return new Date(iso).toLocaleString("es-AR", {
    dateStyle: "long",
    timeStyle: "short",
    hourCycle: "h23",
    timeZone: "America/Argentina/Jujuy",
  });
}

function numero(valor: number): string {
  return valor.toLocaleString("es-AR");
}

function moneda(valor: number, codigo: string): string {
  return `${codigo} ${valor.toLocaleString("es-AR", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
}

function plazo(dias: number | null): string {
  return dias === null ? "sin dato" : `${dias} ${dias === 1 ? "día" : "días"}`;
}
