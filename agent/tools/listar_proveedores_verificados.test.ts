// Tests de la tool listar_proveedores_verificados por su interfaz pública,
// contra el seed en memoria (ticket 02). Determinísticos, sin LLM ni red.

import { describe, expect, it } from "vitest";
import type { ToolContext } from "eve/tools";

import listarProveedores from "./listar_proveedores_verificados";

const ctx = {} as ToolContext;

// execute puede devolver un AsyncIterable; esta tool devuelve un objeto plano.
async function ejecutar(input: Parameters<typeof listarProveedores.execute>[0]) {
  const out = await listarProveedores.execute(input, ctx);
  if (typeof out === "object" && out !== null && Symbol.asyncIterator in out) {
    throw new Error("la tool devolvió un stream inesperado");
  }
  return out as Exclude<typeof out, AsyncIterable<unknown>>;
}

describe("listar_proveedores_verificados", () => {
  it("lista solo la red verificada, ordenada por trust score descendente", async () => {
    const out = await ejecutar({});

    expect(out.total).toBe(16);
    for (const p of out.proveedores) {
      expect(["validado", "homologado"]).toContain(p.estado);
    }
    const scores = out.proveedores.map((p) => p.trust_score);
    expect(scores).toEqual([...scores].sort((a, b) => b - a));
    expect(out.proveedores[0].razon_social).toBe(
      "Reactivos y Químicos San Salvador S.A.",
    );
    expect(out.proveedores[0].trust_score).toBe(95);
    // el desglose del trust score viene con cada proveedor
    const d = out.proveedores[0].trust_score_desglose;
    expect(d.identidad + d.compliance + d.esg + d.capacidad).toBe(
      95,
    );
  });

  it("incluye ubicación, provincias de operación, categorías y certificaciones", async () => {
    const out = await ejecutar({});
    const andina = out.proveedores.find((p) => p.nombre === "Andina EPP");

    expect(andina).toBeDefined();
    expect(andina!.ubicacion).toContain("San Salvador de Jujuy");
    expect(andina!.ubicacion).toContain("Jujuy");
    expect(andina!.provincias_operacion).toContain("Jujuy");
    expect(andina!.categorias.length).toBeGreaterThan(0);
    expect(andina!.certificaciones.length).toBeGreaterThan(0);
  });

  it("filtra por provincia de ubicación u operación", async () => {
    const out = await ejecutar({ provincia: "Salta" });

    expect(out.total).toBeGreaterThan(0);
    expect(out.total).toBeLessThan(16);
    for (const p of out.proveedores) {
      const enSalta =
        p.ubicacion.includes("Salta") || p.provincias_operacion.includes("Salta");
      expect(enSalta).toBe(true);
    }
  });

  it("filtra por texto de razón social o nombre de fantasía", async () => {
    const out = await ejecutar({ busqueda: "andina" });

    expect(out.total).toBe(1);
    expect(out.proveedores[0].razon_social).toBe(
      "Andina de Seguridad Industrial S.R.L.",
    );
  });

  it("filtra por categoría por nombre", async () => {
    const out = await ejecutar({ categoria: "Filtros industriales" });

    expect(out.proveedores.map((p) => p.razon_social).sort()).toEqual([
      "Filtros y Filtrados Puna S.R.L.",
      "Repuestos Pesados Calilegua S.R.L.",
    ]);
  });

  it("un filtro sin coincidencias devuelve lista vacía, no error", async () => {
    const porTexto = await ejecutar({ busqueda: "nombre que no existe" });
    expect(porTexto).toEqual({ total: 0, proveedores: [] });

    const porCategoria = await ejecutar({ categoria: "categoría inexistente" });
    expect(porCategoria).toEqual({ total: 0, proveedores: [] });
  });
});
