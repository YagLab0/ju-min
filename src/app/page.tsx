import Link from "next/link";
import { Estante3D } from "@/components/estante-3d";

export default function Landing() {
  return (
    <>
      {/* Hero: qué hace ju-min en una frase + la zona del estante 3D */}
      <section className="mx-auto grid w-full max-w-6xl gap-10 px-5 py-16 sm:py-24 lg:grid-cols-2 lg:items-center">
        <div className="max-w-xl">
          <h1 className="font-display text-display font-bold text-sal">
            Cuando un insumo cruza el punto de reorden, ju-min ya sabe a quién
            comprarle.
          </h1>
          <p className="mt-5 text-subtitulo text-bruma">
            Un agente que monitorea el stock de la minera, avisa cuando un
            insumo entra en alerta y recomienda ofertas de proveedores
            verificados, con justificación.
          </p>
          <div className="mt-8 flex flex-col gap-3 sm:flex-row">
            <Link
              href="/panel"
              className="bg-senal px-6 py-3 text-center font-display font-semibold text-grafito transition-colors hover:bg-sal"
            >
              Abrir el panel de la minera
            </Link>
            <Link
              href="/proveedores"
              className="border border-bruma/40 px-6 py-3 text-center font-display font-semibold text-sal transition-colors hover:border-senal hover:text-senal"
            >
              Ver proveedores verificados
            </Link>
          </div>
        </div>

        {/* La pieza protagonista: el estante de insumos con la secuencia
            stock bajando → punto de reorden → alerta → recomendación */}
        <Estante3D />
      </section>

      {/* El flujo de ju-min, en la secuencia real del demo */}
      <section className="border-t border-bruma/25">
        <div className="mx-auto w-full max-w-6xl px-5 py-14">
          <h2 className="font-display text-titulo font-bold text-sal">
            Cómo trabaja
          </h2>
          <ol className="mt-8 grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {[
              {
                paso: "1",
                titulo: "Alerta de stock",
                texto:
                  "El stock de un insumo baja y cruza el punto de reorden.",
              },
              {
                paso: "2",
                titulo: "Consulta al agente",
                texto:
                  "La minera consulta desde la alerta o con texto libre.",
              },
              {
                paso: "3",
                titulo: "Recomendación",
                texto:
                  "El agente propone una oferta de un proveedor verificado y explica por qué.",
              },
              {
                paso: "4",
                titulo: "Decisión",
                texto:
                  "La minera aprueba o rechaza; todo queda en el historial.",
              },
            ].map(({ paso, titulo, texto }) => (
              <li key={paso} className="border border-bruma/25 bg-roca p-5">
                <span
                  aria-hidden="true"
                  className="font-display text-titulo font-bold text-cobre"
                >
                  {paso}
                </span>
                <h3 className="mt-2 font-display font-semibold text-sal">
                  {titulo}
                </h3>
                <p className="mt-1 text-detalle text-bruma">{texto}</p>
              </li>
            ))}
          </ol>
        </div>
      </section>

      {/* De dónde salen los proveedores y cómo es el negocio */}
      <section className="border-t border-bruma/25">
        <div className="mx-auto grid w-full max-w-6xl gap-10 px-5 py-14 sm:grid-cols-2">
          <div>
            <h2 className="font-display text-titulo font-bold text-sal">
              Proveedores verificados
            </h2>
            <p className="mt-4 text-cuerpo text-bruma">
              La red se arma desde el Registro Provincial de Proveedores
              Mineros de Jujuy y las cámaras del sector (CAPMIN, CAEM). Cada
              proveedor verificado tiene un trust score calculado sobre su
              historial de entregas, certificaciones y antigüedad fiscal.
            </p>
            <Link
              href="/proveedores"
              className="mt-5 inline-block border border-bruma/40 px-5 py-2.5 font-display font-semibold text-sal transition-colors hover:border-senal hover:text-senal"
            >
              Explorar la red de proveedores
            </Link>
          </div>
          <div>
            <h2 className="font-display text-titulo font-bold text-sal">
              Suscripción y roadmap
            </h2>
            <p className="mt-4 text-cuerpo text-bruma">
              ju-min funciona por suscripción para la minera. El siguiente
              paso del roadmap son los pagos automáticos al detectar falta de
              stock, siempre con aprobación humana previa.
            </p>
            <Link
              href="/panel"
              className="mt-5 inline-block bg-senal px-5 py-2.5 font-display font-semibold text-grafito transition-colors hover:bg-sal"
            >
              Probar el panel de la minera
            </Link>
          </div>
        </div>
      </section>
    </>
  );
}
