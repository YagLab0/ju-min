// Tests de la tool listar_ofertas_de_insumo por su interfaz pública,
// contra el seed en memoria (ticket 03). Determinísticos, sin LLM ni red.

import { describe, expect, it } from "vitest";
import type { ToolContext } from "eve/tools";

import listarOfertas from "./listar_ofertas_de_insumo";

const ctx = {} as ToolContext;

// execute puede devolver un AsyncIterable; esta tool devuelve un objeto plano.
async function ejecutar(input: Parameters<typeof listarOfertas.execute>[0]) {
  const out = await listarOfertas.execute(input, ctx);
  if (typeof out === "object" && out !== null && Symbol.asyncIterator in out) {
    throw new Error("la tool devolvió un stream inesperado");
  }
  return out as Exclude<typeof out, AsyncIterable<unknown>>;
}
const ID_GUANTE = "10000000-0000-4000-8000-000000000001";

describe("listar_ofertas_de_insumo", () => {
  it("un texto parcial resuelve al insumo y devuelve sus ofertas", async () => {
    const out = await ejecutar({ insumo: "guante" });

    expect(out.total).toBe(1);
    const insumo = out.insumos[0];
    expect(insumo.insumo).toBe("Guante de nitrilo industrial");
    expect(insumo.unidad).toBe("par");
    expect(insumo.ofertas).toHaveLength(2);
    for (const o of insumo.ofertas) {
      expect(o.proveedor).toBeTruthy();
      expect(o.trust_score).toBeGreaterThan(0);
      expect(o.moneda).toBe("ARS");
    }
    // ordenadas para comparar: menor lead time primero
    expect(insumo.ofertas[0].lead_time_dias).toBe(7);
    expect(insumo.ofertas[0].precio).toBe(3800);
    expect(insumo.ofertas[0].proveedor).toBe("Andina EPP");
    expect(insumo.ofertas[0].trust_score).toBe(91);
  });

  it("busca por id de insumo", async () => {
    const out = await ejecutar({ insumo_id: ID_GUANTE });

    expect(out.total).toBe(1);
    expect(out.insumos[0].insumo_id).toBe(ID_GUANTE);
    expect(out.insumos[0].ofertas).toHaveLength(2);
  });

  it("el texto parcial no distingue acentos ni mayúsculas", async () => {
    const out = await ejecutar({ insumo: "ACIDO" });

    expect(out.total).toBe(1);
    expect(out.insumos[0].insumo).toBe("Ácido sulfúrico 98%");
  });

  it("solo incluye ofertas de proveedores de la red verificada", async () => {
    const out = await ejecutar({ insumo: "guante" });
    const proveedores = out.insumos[0].ofertas.map((o) => o.proveedor);

    // los mismos que muestra el listado de proveedores verificados
    expect(proveedores).toContain("Andina EPP");
    expect(proveedores).toContain("RepuCali");
  });

  it("un insumo inexistente devuelve lista vacía, no error", async () => {
    const porTexto = await ejecutar({ insumo: "insumo que no existe" });
    expect(porTexto).toEqual({ total: 0, insumos: [] });

    const porId = await ejecutar({ insumo_id: "99999999-9999-4999-8999-999999999999" });
    expect(porId).toEqual({ total: 0, insumos: [] });
  });
});
