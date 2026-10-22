import type { Metadata, Viewport } from "next";
import { Saira, Saira_Semi_Condensed } from "next/font/google";
import { TooltipProvider } from "@/components/ui/tooltip";
import "./globals.css";
import { Navegacion } from "@/components/navegacion";

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
    default: "ju-min — Consultor inteligente de compras para minería",
    template: "%s — ju-min",
  },
  description:
    "ju-min detecta insumos por debajo del punto de reorden y recomienda comprar a proveedores verificados, con justificación.",
};

export const viewport: Viewport = {
  themeColor: "#1f1c18",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html
      lang="es"
      className={`${saira.variable} ${sairaSemiCondensed.variable} h-full antialiased`}
    >
      <body className="flex min-h-full flex-col bg-grafito text-sal">
        <TooltipProvider>
          <a
            href="#contenido"
            className="sr-only bg-senal px-4 py-2 font-display font-semibold text-grafito focus:not-sr-only focus:absolute focus:left-4 focus:top-4 focus:z-50"
          >
            Saltar al contenido
          </a>
          <Navegacion />
          <main id="contenido" className="flex-1">
            {children}
          </main>
          <footer className="border-t border-bruma/25">
            <div className="mx-auto flex w-full max-w-6xl flex-col gap-1 px-5 py-6 text-detalle text-bruma sm:flex-row sm:items-center sm:justify-between">
              <span className="font-display font-semibold text-sal">ju-min</span>
              <p>Demo sin transacciones reales: el contacto con proveedores es simulado.</p>
            </div>
          </footer>
        </TooltipProvider>
      </body>
    </html>
  );
}
