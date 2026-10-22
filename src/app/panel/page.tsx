import type { Metadata } from "next";
import { Consulta } from "./consulta";

export const metadata: Metadata = {
  title: "Panel · ju-min",
  description:
    "Panel de la minera: consultas al agente de ju-min, consultor inteligente de compras para minería.",
};

export default function PanelPage() {
  return (
    <div className="flex h-dvh flex-col">
      <header className="flex items-baseline gap-3 border-b px-4 py-3">
        <h1 className="text-lg font-semibold tracking-tight">ju-min</h1>
        <p className="text-sm text-muted-foreground">
          Consultor inteligente de compras para minería
        </p>
      </header>
      <main className="min-h-0 flex-1">
        <Consulta />
      </main>
    </div>
  );
}
