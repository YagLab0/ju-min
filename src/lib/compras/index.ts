// Entrada del módulo de dominio para la app Next: la misma API que
// dominio.ts, con la guarda que impide importarlo desde un Client Component.
// Las tools del agente importan "@/lib/compras/dominio" directo: eve compila
// fuera de React y `server-only` sin la condición react-server tira al
// cargarse (en Vercel el build de eve no recibe esa condición).

import "server-only";

export * from "./dominio";
