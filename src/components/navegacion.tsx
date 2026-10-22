"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ReactNode } from "react";

const enlaces = [
  { href: "/", etiqueta: "Inicio" },
  { href: "/panel", etiqueta: "Panel" },
  { href: "/proveedores", etiqueta: "Proveedores" },
] as const;

export function Navegacion({ sesion }: { sesion?: ReactNode }) {
  const pathname = usePathname();

  return (
    <header className="sticky top-0 z-40 border-b border-linea bg-ficha/90 backdrop-blur-sm">
      <nav
        aria-label="Navegación principal"
        className="mx-auto flex w-full max-w-6xl items-center gap-6 px-5 py-3"
      >
        <Link
          href="/"
          className="flex items-center gap-2 font-display text-subtitulo font-bold tracking-tight text-tinta"
        >
          <svg
            aria-hidden="true"
            viewBox="0 0 24 24"
            className="h-5 w-5 text-senal"
            fill="currentColor"
          >
            {/* Bancos de un rajo abierto: tres terrazas escalonadas */}
            <path d="M3 6h18v3H6v3h15v3H9v3h12v3H3z" />
          </svg>
          Jumin
        </Link>
        <ul className="ml-auto flex items-center gap-1 text-detalle">
          {enlaces.map(({ href, etiqueta }) => {
            const activo =
              href === "/" ? pathname === "/" : pathname.startsWith(href);
            return (
              <li key={href}>
                <Link
                  href={href}
                  aria-current={activo ? "page" : undefined}
                  className={`relative block rounded-md px-3 py-2 transition-colors ${
                    activo
                      ? "font-semibold text-tinta"
                      : "text-piedra hover:text-tinta"
                  }`}
                >
                  {etiqueta}
                  {activo && (
                    <span
                      aria-hidden="true"
                      className="absolute inset-x-3 -bottom-[13px] h-0.5 rounded-full bg-senal"
                    />
                  )}
                </Link>
              </li>
            );
          })}
        </ul>
        {sesion}
      </nav>
    </header>
  );
}
