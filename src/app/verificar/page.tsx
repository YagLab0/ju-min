import type { Metadata } from "next";

import { verificarInforme, type Informe } from "@/lib/compras";

export const metadata: Metadata = {
  title: "Verificar informe",
};

// Página pública: un auditor ingresa el código impreso en el PDF y ve los
// datos originales del informe. Lee `codigo` de searchParams por request.
export const instant = false;

export default async function Verificar(props: PageProps<"/verificar">) {
  const params = await props.searchParams;
  const codigo = typeof params.codigo === "string" ? params.codigo.trim() : "";
  const resultado = codigo ? await verificarInforme(codigo) : null;

  return (
    <div className="mx-auto flex w-full max-w-2xl flex-col px-5 py-16 sm:py-24">
      <div className="overflow-hidden rounded-xl border border-linea bg-ficha shadow-sm">
        <div className="franja-seguridad h-1.5" aria-hidden="true" />
        <div className="p-6 sm:p-8">
          <h1 className="font-display text-titulo font-bold text-tinta">
            Verificar un informe
          </h1>
          <p className="mt-2 text-detalle text-piedra">
            Ingresá el código impreso en el informe PDF (por ejemplo,
            JM-7K3Q-9XWD-2M4P) para confirmar que lo generó ju-min y ver sus
            datos originales.
          </p>

          <form method="get" className="mt-6 flex flex-wrap gap-3">
            <label htmlFor="codigo" className="sr-only">
              Código del informe
            </label>
            <input
              id="codigo"
              name="codigo"
              defaultValue={codigo}
              required
              autoComplete="off"
              placeholder="JM-XXXX-XXXX-XXXX"
              className="min-w-0 flex-1 rounded-lg border border-linea bg-papel px-3 py-2 font-mono text-cuerpo uppercase text-tinta"
            />
            <button
              type="submit"
              className="rounded-lg bg-tinta px-4 py-2 text-detalle font-semibold text-papel"
            >
              Verificar
            </button>
          </form>

          {codigo && !resultado && (
            <p
              role="status"
              className="mt-6 rounded-lg bg-papel p-4 text-detalle text-tinta"
            >
              No existe un informe con el código <b>{codigo.toUpperCase()}</b>.
              Revisá que esté bien escrito.
            </p>
          )}
          {resultado && (
            <DatosInforme
              informe={resultado.informe}
              integro={resultado.integro}
            />
          )}
        </div>
      </div>
    </div>
  );
}

function DatosInforme({
  informe,
  integro,
}: {
  informe: Informe;
  integro: boolean;
}) {
  const c = informe.contenido;
  const fecha = new Date(informe.creadoEn).toLocaleString("es-AR", {
    dateStyle: "long",
    timeStyle: "short",
    hourCycle: "h23",
    timeZone: "America/Argentina/Jujuy",
  });
  return (
    <div className="mt-6 space-y-4" role="status">
      <p
        className={`rounded-lg p-4 text-detalle font-semibold ${
          integro ? "bg-papel text-tinta" : "bg-senal text-tinta"
        }`}
      >
        {integro
          ? `Informe auténtico: lo generó ju-min el ${fecha}. Si los datos de tu PDF no coinciden con los de abajo, el PDF fue modificado.`
          : "Atención: el registro de este informe no coincide con su sello. No lo uses como respaldo y avisá a ju-min."}
      </p>
      <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-2 text-detalle">
        <dt className="text-piedra">Código</dt>
        <dd className="font-mono text-tinta">{informe.codigo}</dd>
        <dt className="text-piedra">Minera</dt>
        <dd className="text-tinta">{c.minera}</dd>
        <dt className="text-piedra">Generado por</dt>
        <dd className="text-tinta">{informe.generadoPor.nombre}</dd>
        <dt className="text-piedra">Insumo</dt>
        <dd className="text-tinta">{c.insumo.nombre}</dd>
        <dt className="text-piedra">Proveedor</dt>
        <dd className="text-tinta">
          {c.proveedor.razonSocial}
          {c.proveedor.cuit ? ` · CUIT ${c.proveedor.cuit}` : ""}
        </dd>
        <dt className="text-piedra">Oferta</dt>
        <dd className="text-tinta">
          {c.oferta.moneda} {c.oferta.precio.toLocaleString("es-AR")} ·{" "}
          {c.oferta.leadTimeDias === null
            ? "plazo sin dato"
            : `${c.oferta.leadTimeDias} días`}{" "}
          · trust score {Math.round(c.proveedor.trustScore)}/100
        </dd>
        <dt className="text-piedra">Sello</dt>
        <dd className="break-all font-mono text-micro text-piedra">
          {informe.sello}
        </dd>
      </dl>
    </div>
  );
}
