import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Suspense } from "react";

import { BotonContactoProveedor } from "@/components/contacto-proveedor";
import { arquetipoParaInsumo } from "@/components/insumo-escena";
import { PreviewInsumo } from "@/components/preview-insumo";
import {
  obtenerProveedorVerificado,
  type CertificacionAcreditada,
  type CondicionIva,
  type EstadoProveedor,
  type EstadoVerificacion,
  type FuenteVerificacion,
  type ProveedorVerificadoDetalle,
  type TrustScore,
} from "@/lib/compras";

// La ficha es siempre de tiempo de petición (params + datos del módulo):
// no produce shell estático y se le permite bloquear la navegación.
export const instant = false;

export async function generateMetadata(
  props: PageProps<"/proveedores/[id]">,
): Promise<Metadata> {
  const { id } = await props.params;
  const proveedor = await obtenerProveedorVerificado(id);
  return {
    title: proveedor
      ? (proveedor.nombreFantasia ?? proveedor.razonSocial)
      : "Proveedor no encontrado",
  };
}

const ETIQUETA_ESTADO: Record<EstadoProveedor, string> = {
  registrado: "Registrado",
  documentado: "Documentado",
  validado: "Validado",
  auditado: "Auditado",
  homologado: "Homologado",
  suspendido: "Suspendido",
};

const ETIQUETA_FUENTE: Record<FuenteVerificacion, string> = {
  capmin: "Directorio CAPMIN",
  caem: "Asociados CAEM",
  registro_jujuy: "Registro Provincial de Proveedores Mineros de Jujuy",
  manual: "Carga manual",
};

const ETIQUETA_CONDICION_IVA: Record<CondicionIva, string> = {
  responsable_inscripto: "Responsable Inscripto",
  monotributo: "Monotributo",
  exento: "Exento",
  no_responsable: "No responsable",
  desconocido: "No informado",
};

const ETIQUETA_ESTADO_CERT: Record<EstadoVerificacion, string> = {
  verificado: "Verificado",
  en_revision: "En revisión",
  declarado: "Declarado",
  vencido: "Vencido",
  rechazado: "Rechazado",
};

const ORDEN_ESTADO_CERT: EstadoVerificacion[] = [
  "verificado",
  "en_revision",
  "declarado",
  "vencido",
  "rechazado",
];

/** Grupos de señales del trust score con sus pesos (DOCS.md §3.2). */
const GRUPOS_TRUST: {
  clave: keyof TrustScore["desglose"];
  nombre: string;
  peso: number;
  senales: string;
}[] = [
  {
    clave: "identidad",
    nombre: "Identidad",
    peso: 20,
    senales: "CUIT validado, antigüedad fiscal, registro provincial",
  },
  {
    clave: "compliance",
    nombre: "Compliance",
    peso: 30,
    senales: "Certificaciones vigentes y habilitaciones sectoriales",
  },
  {
    clave: "desempeno",
    nombre: "Desempeño",
    peso: 30,
    senales: "Historial de entregas y rating en directorios",
  },
  {
    clave: "esg",
    nombre: "ESG",
    peso: 10,
    senales: "Huella de carbono reportada y políticas",
  },
  {
    clave: "capacidad",
    nombre: "Capacidad",
    peso: 10,
    senales: "Lead time, cobertura geográfica y respuesta",
  },
];

const formatoPrecio = (precio: number, moneda: string) =>
  new Intl.NumberFormat("es-AR", {
    style: "currency",
    currency: moneda,
    maximumFractionDigits: 0,
  }).format(precio);

const formatoFecha = (iso: string) =>
  new Intl.DateTimeFormat("es-AR", {
    day: "numeric",
    month: "long",
    year: "numeric",
    timeZone: "UTC",
  }).format(new Date(iso));

export default function FichaProveedorPage(
  props: PageProps<"/proveedores/[id]">,
) {
  return (
    <div className="mx-auto w-full max-w-6xl px-5 py-14">
      <Link
        href="/proveedores"
        className="text-detalle text-piedra underline-offset-4 hover:text-tinta hover:underline"
      >
        Volver al listado de proveedores
      </Link>
      <Suspense
        fallback={
          <p className="mt-10 rounded-2xl border border-linea bg-ficha shadow-sm p-5 text-detalle text-piedra">
            Cargando la ficha del proveedor…
          </p>
        }
      >
        <FichaProveedor params={props.params} />
      </Suspense>
    </div>
  );
}

async function FichaProveedor({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  // La página solo habla con el módulo de dominio de compras.
  const p = await obtenerProveedorVerificado(id);
  if (!p) notFound();

  return (
    <>
      <header className="mt-6 flex flex-wrap items-start justify-between gap-6 rounded-2xl border border-linea bg-ficha shadow-sm p-5">
        <div className="min-w-0">
          <div className="flex flex-wrap items-center gap-3">
            <h1 className="font-display text-titulo font-bold text-tinta">
              {p.nombreFantasia ?? p.razonSocial}
            </h1>
            <span
              className={
                p.estado === "homologado"
                  ? "bg-senal rounded-md px-1.5 py-0.5 text-micro font-semibold text-tinta"
                  : "border border-linea rounded-md px-1.5 py-0.5 text-micro text-piedra"
              }
            >
              {ETIQUETA_ESTADO[p.estado]}
            </span>
          </div>
          {p.nombreFantasia && (
            <p className="mt-1 text-detalle text-piedra">{p.razonSocial}</p>
          )}
          <p className="mt-1 text-detalle text-piedra">
            {[p.localidad, p.provincia].filter(Boolean).join(", ")}
          </p>
          <div className="mt-3 flex flex-wrap gap-1.5">
            {p.categorias.map((c) => (
              <span
                key={c.id}
                className="border border-linea rounded-md px-2 py-0.5 text-micro text-piedra"
              >
                {c.nombre}
              </span>
            ))}
          </div>
          <div className="mt-5">
            <BotonContactoProveedor
              nombreProveedor={p.nombreFantasia ?? p.razonSocial}
              email={p.email}
              telefono={p.telefono}
            />
          </div>
        </div>
        <div className="shrink-0 text-right">
          <p className="font-display text-display font-bold leading-none text-tinta">
            {Math.round(p.trustScore.valor)}
          </p>
          <p className="text-detalle text-piedra">trust score</p>
          <div
            className="ml-auto mt-2 h-1.5 w-28 bg-linea"
            role="img"
            aria-label={`Trust score ${Math.round(p.trustScore.valor)} de 100`}
          >
            <div
              className="h-1.5 bg-cobre"
              style={{ width: `${Math.round(p.trustScore.valor)}%` }}
            />
          </div>
        </div>
      </header>

      <div className="mt-8 grid gap-6 lg:grid-cols-3">
        <div className="flex min-w-0 flex-col gap-6 lg:col-span-2">
          <OfertasFicha proveedor={p} />
          <CertificacionesFicha proveedor={p} />
        </div>
        <aside className="flex min-w-0 flex-col gap-6">
          <TrustScoreFicha proveedor={p} />
          <FuenteFicha proveedor={p} />
          <DatosFicha proveedor={p} />
        </aside>
      </div>
    </>
  );
}

function OfertasFicha({ proveedor: p }: { proveedor: ProveedorVerificadoDetalle }) {
  return (
    <section className="rounded-2xl border border-linea bg-ficha shadow-sm" aria-labelledby="ofertas">
      <div className="border-b border-linea px-5 py-4">
        <h2
          id="ofertas"
          className="font-display text-subtitulo font-semibold text-tinta"
        >
          Ofertas
        </h2>
        <p className="mt-1 text-micro text-piedra">
          {p.ofertas.length === 1
            ? "1 insumo publicado por este proveedor"
            : `${p.ofertas.length} insumos publicados por este proveedor`}
        </p>
      </div>
      {p.ofertas.length === 0 ? (
        <p className="p-5 text-detalle text-piedra">
          Este proveedor todavía no tiene ofertas publicadas.
        </p>
      ) : (
        <div className="overflow-x-auto">
          <table className="w-full min-w-[34rem] text-left text-detalle">
            <thead>
              <tr className="border-b border-linea text-micro text-piedra">
                <th scope="col" className="px-5 py-3 font-medium">
                  Insumo
                </th>
                <th scope="col" className="px-3 py-3 font-medium">
                  Precio
                </th>
                <th scope="col" className="px-3 py-3 font-medium">
                  Unidad
                </th>
                <th scope="col" className="px-3 py-3 font-medium">
                  Lead time
                </th>
                <th scope="col" className="px-5 py-3 font-medium">
                  Disponibilidad
                </th>
              </tr>
            </thead>
            <tbody>
              {p.ofertas.map((o) => (
                <tr
                  key={o.id}
                  className="border-b border-linea last:border-b-0"
                >
                  <td className="px-5 py-3">
                    <div className="flex items-center gap-3">
                      {/* Miniatura 3D del insumo (mismo renderer compartido
                          que las cards del marketplace). */}
                      <div className="relative h-12 w-16 shrink-0 overflow-hidden rounded-lg border border-linea bg-papel">
                        <PreviewInsumo
                          arquetipo={arquetipoParaInsumo(o.insumo.nombre)}
                          className="absolute inset-0"
                        />
                      </div>
                      <div className="min-w-0">
                        <p className="font-medium text-tinta">
                          {o.insumo.nombre}
                        </p>
                        {o.insumo.especificacion && (
                          <p className="text-micro text-piedra">
                            {o.insumo.especificacion}
                          </p>
                        )}
                      </div>
                    </div>
                  </td>
                  <td className="whitespace-nowrap px-3 py-3 font-display font-semibold text-tinta">
                    {formatoPrecio(o.precio, o.moneda)}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3 text-piedra">
                    por {o.insumo.unidad}
                  </td>
                  <td className="whitespace-nowrap px-3 py-3 text-piedra">
                    {o.leadTimeDias !== null
                      ? `${o.leadTimeDias} días`
                      : "A convenir"}
                  </td>
                  <td className="whitespace-nowrap px-5 py-3">
                    {o.disponible ? (
                      <span className="border border-cobre/40 rounded-md px-2 py-0.5 text-micro text-tinta">
                        Disponible
                      </span>
                    ) : (
                      <span className="bg-senal rounded-md px-2 py-0.5 text-micro font-semibold text-tinta">
                        Sin stock
                      </span>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </section>
  );
}

function CertificacionesFicha({
  proveedor: p,
}: {
  proveedor: ProveedorVerificadoDetalle;
}) {
  const certificaciones = [...p.certificaciones].sort(
    (a, b) =>
      ORDEN_ESTADO_CERT.indexOf(a.estado) -
        ORDEN_ESTADO_CERT.indexOf(b.estado) ||
      a.certificacion.nombre.localeCompare(b.certificacion.nombre, "es"),
  );
  return (
    <section
      className="rounded-2xl border border-linea bg-ficha shadow-sm"
      aria-labelledby="certificaciones"
    >
      <div className="border-b border-linea px-5 py-4">
        <h2
          id="certificaciones"
          className="font-display text-subtitulo font-semibold text-tinta"
        >
          Certificaciones
        </h2>
        <p className="mt-1 text-micro text-piedra">
          Normas y habilitaciones acreditadas, con su estado y vencimiento.
        </p>
      </div>
      {certificaciones.length === 0 ? (
        <p className="p-5 text-detalle text-piedra">
          Este proveedor no tiene certificaciones acreditadas.
        </p>
      ) : (
        <ul className="divide-y divide-linea">
          {certificaciones.map((c) => (
            <FilaCertificacion key={claveCertificacion(c)} cert={c} />
          ))}
        </ul>
      )}
    </section>
  );
}

function claveCertificacion(c: CertificacionAcreditada): string {
  return [c.certificacion.id, c.numeroCertificado ?? "sin-numero"].join(":");
}

function FilaCertificacion({ cert: c }: { cert: CertificacionAcreditada }) {
  const alerta = c.estado === "vencido" || c.estado === "rechazado";
  return (
    <li className="flex flex-wrap items-start justify-between gap-3 px-5 py-4">
      <div className="min-w-0">
        <p className="font-medium text-tinta">{c.certificacion.nombre}</p>
        <p className="mt-0.5 text-micro text-piedra">
          {[
            c.certificacion.ambito === "producto" ? "Producto" : "Empresa",
            c.organismo,
            c.numeroCertificado,
          ]
            .filter(Boolean)
            .join(" · ")}
        </p>
        {c.fechaVencimiento && (
          <p className="mt-0.5 text-micro text-piedra">
            Vence el {formatoFecha(c.fechaVencimiento)}
          </p>
        )}
      </div>
      <span
        className={
          alerta
            ? "bg-senal rounded-md px-2 py-0.5 text-micro font-semibold text-tinta"
            : c.estado === "verificado"
              ? "border border-cobre/40 rounded-md px-2 py-0.5 text-micro text-tinta"
              : "border border-linea rounded-md px-2 py-0.5 text-micro text-piedra"
        }
      >
        {ETIQUETA_ESTADO_CERT[c.estado]}
      </span>
    </li>
  );
}

function TrustScoreFicha({
  proveedor: p,
}: {
  proveedor: ProveedorVerificadoDetalle;
}) {
  return (
    <section
      className="rounded-2xl border border-linea bg-ficha shadow-sm p-5"
      aria-labelledby="trust-score"
    >
      <h2
        id="trust-score"
        className="font-display text-subtitulo font-semibold text-tinta"
      >
        Desglose del trust score
      </h2>
      <p className="mt-1 text-micro text-piedra">
        Cada grupo de señales aporta hasta su peso en el puntaje total.
      </p>
      <ul className="mt-4 space-y-4">
        {GRUPOS_TRUST.map((g) => {
          const puntos = p.trustScore.desglose[g.clave];
          return (
            <li key={g.clave}>
              <div className="flex items-baseline justify-between gap-3">
                <p className="text-detalle font-semibold text-tinta">
                  {g.nombre}
                  <span className="ml-1.5 text-micro font-normal text-piedra">
                    peso {g.peso}%
                  </span>
                </p>
                <p className="text-detalle text-piedra">
                  {puntos} / {g.peso}
                </p>
              </div>
              <p className="mt-0.5 text-micro text-piedra">{g.senales}</p>
              <div
                className="mt-1.5 h-1 bg-linea"
                role="img"
                aria-label={`${g.nombre}: ${puntos} de ${g.peso} puntos`}
              >
                <div
                  className="h-1 bg-cobre"
                  style={{ width: `${Math.min(100, (puntos / g.peso) * 100)}%` }}
                />
              </div>
            </li>
          );
        })}
      </ul>
    </section>
  );
}

function FuenteFicha({ proveedor: p }: { proveedor: ProveedorVerificadoDetalle }) {
  return (
    <section
      className="rounded-2xl border border-linea bg-ficha shadow-sm p-5"
      aria-labelledby="fuente"
    >
      <h2
        id="fuente"
        className="font-display text-subtitulo font-semibold text-tinta"
      >
        Fuente de verificación
      </h2>
      <p className="mt-2 text-detalle text-tinta">{ETIQUETA_FUENTE[p.fuente]}</p>
      {p.registroJujuyEstado && (
        <p className="mt-1 text-detalle text-piedra">
          Registro Provincial de Jujuy:{" "}
          {p.registroJujuyEstado === "aprobado" ? "aprobado" : "pendiente"}
        </p>
      )}
      {p.fuenteUrl && (
        <a
          href={p.fuenteUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="mt-3 inline-block text-detalle text-piedra underline underline-offset-4 hover:text-tinta"
        >
          Visitar la fuente
        </a>
      )}
    </section>
  );
}

function DatosFicha({ proveedor: p }: { proveedor: ProveedorVerificadoDetalle }) {
  const filas: [string, string | null][] = [
    ["CUIT", p.cuit],
    ["Condición frente a IVA", ETIQUETA_CONDICION_IVA[p.condicionIva]],
    [
      "Constituida",
      p.fechaConstitucion ? formatoFecha(p.fechaConstitucion) : null,
    ],
    [
      "Domicilio",
      [p.domicilio, p.localidad, p.provincia].filter(Boolean).join(", ") ||
        null,
    ],
    [
      "Opera en",
      p.provinciasOperacion.length ? p.provinciasOperacion.join(", ") : null,
    ],
    ["Sitio web", p.sitioWeb],
    ["Email", p.email],
    ["Teléfono", p.telefono],
  ].filter((fila): fila is [string, string] => fila[1] !== null);

  return (
    <section
      className="rounded-2xl border border-linea bg-ficha shadow-sm p-5"
      aria-labelledby="datos"
    >
      <h2
        id="datos"
        className="font-display text-subtitulo font-semibold text-tinta"
      >
        Datos del proveedor
      </h2>
      <dl className="mt-3 space-y-2 text-detalle">
        {filas.map(([etiqueta, valor]) => (
          <div key={etiqueta} className="flex flex-wrap gap-x-2">
            <dt className="shrink-0 text-piedra">{etiqueta}</dt>
            <dd className="min-w-0 break-words text-tinta">{valor}</dd>
          </div>
        ))}
      </dl>
    </section>
  );
}
