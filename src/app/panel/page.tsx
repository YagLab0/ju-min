import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Panel de la minera",
};

const zonas = [
  {
    titulo: "Stock de insumos",
    texto:
      "El stock actual de cada insumo, su punto de reorden y los días restantes según el consumo. Los insumos en alerta se destacan.",
  },
  {
    titulo: "Consultas al agente",
    texto:
      "Espacio para hacerle consultas al agente, desde una alerta de stock o con texto libre.",
  },
  {
    titulo: "Recomendaciones pendientes",
    texto:
      "La cola de recomendaciones del agente para aprobar o rechazar, separada del historial ya decidido.",
  },
] as const;

export default function Panel() {
  return (
    <div className="mx-auto w-full max-w-6xl px-5 py-14">
      <h1 className="font-display text-display font-bold text-sal">
        Panel de la minera
      </h1>
      <p className="mt-4 max-w-2xl text-subtitulo text-bruma">
        La vista de trabajo de la minera: qué insumos hay que reponer, qué
        recomienda el agente y qué decisiones quedan pendientes.
      </p>
      <div className="mt-10 grid gap-6 lg:grid-cols-3">
        {zonas.map(({ titulo, texto }) => (
          <section
            key={titulo}
            className="border border-bruma/25 bg-roca p-5"
          >
            <h2 className="font-display font-semibold text-sal">{titulo}</h2>
            <p className="mt-2 text-detalle text-bruma">{texto}</p>
            <p className="mt-4 w-fit border border-bruma/30 px-2 py-0.5 text-micro text-bruma">
              En construcción
            </p>
          </section>
        ))}
      </div>
    </div>
  );
}
