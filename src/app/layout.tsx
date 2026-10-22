import type { Metadata, Viewport } from "next";
import { Saira, Saira_Semi_Condensed } from "next/font/google";
import { Suspense } from "react";
import { TooltipProvider } from "@/components/ui/tooltip";
import "./globals.css";
import { Navegacion } from "@/components/navegacion";
import { AreaSesion } from "@/components/sesion-nav";

const saira = Saira({
  variable: "--font-saira",
  subsets: ["latin"],
});

const sairaSemiCondensed = Saira_Semi_Condensed({
  weight: ["600", "700"],
  variable: "--font-saira-semi-condensed",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: {
    default: "Jumin — Consultor inteligente de compras para minería",
    template: "%s — Jumin",
  },
  description:
    "Jumin detecta insumos por debajo del punto de reorden y recomienda comprar a proveedores verificados, con justificación.",
};

export const viewport: Viewport = {
  themeColor: "#f8f6f1",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html
      lang="es"
      className={`${saira.variable} ${sairaSemiCondensed.variable} h-full antialiased`}
    >
      <body className="flex min-h-full flex-col bg-papel text-tinta">
        <TooltipProvider>
          <a
            href="#contenido"
            className="sr-only bg-senal px-4 py-2 font-display font-semibold text-tinta focus:not-sr-only focus:absolute focus:left-4 focus:top-4 focus:z-50"
          >
            Saltar al contenido
          </a>
          <Navegacion
            sesion={
              // La cookie de sesión se lee por request, fuera del shell
              // prerenderizado: va detrás de su propio Suspense.
              <Suspense fallback={null}>
                <AreaSesion />
              </Suspense>
            }
          />
          <main id="contenido" className="flex-1">
            {children}
          </main>
          <footer className="border-t border-linea">
            <div className="mx-auto flex w-full max-w-6xl flex-col gap-1 px-5 py-6 text-detalle text-piedra sm:flex-row sm:items-center sm:justify-between">
              <span className="font-display font-semibold text-tinta">Jumin</span>
              <p>Demo sin transacciones reales: el contacto con proveedores es simulado.</p>
            </div>
          </footer>
        </TooltipProvider>
      </body>
    </html>
  );
}
