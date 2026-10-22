// Tests de la tool consultar_stock por su interfaz pública, contra el seed
// en memoria (ticket 01). Determinísticos, sin LLM ni red.

import { describe, expect, it } from "vitest";
import type { ToolContext } from "eve/tools";

import consultarStock from "./consultar_stock";

const ctx = {} as ToolContext;

// execute puede devolver un AsyncIterable; esta tool devuelve un objeto plano.
async function ejecutar(input: Parameters<typeof consultarStock.execute>[0]) {
  const out = await consultarStock.execute(input, ctx);
  if (typeof out === "object" && out !== null && Symbol.asyncIterator in out) {
    throw new Error("la tool devolvió un stream inesperado");
  }
  return out as Exclude<typeof out, AsyncIterable<unknown>>;
}

describe("consultar_stock", () => {
  it("devuelve el stock del seed con estado y días restantes", async () => {
    const out = await ejecutar({});

    expect(out.total).toBe(8);
    expect(out.en_alerta).toBe(1);
    const guante = out.stock.find((s) => s.insumo === "Guante de nitrilo industrial");
    expect(guante).toBeDefined();
    expect(guante!.cantidad_actual).toBe(120);
    expect(guante!.punto_reorden).toBe(300);
    expect(guante!.consumo_mensual).toBe(600);
    expect(guante!.estado).toBe("alerta");
    expect(guante!.dias_restantes).toBe(6);
    // las alertas van primero para reponer primero
    expect(out.stock[0].estado).toBe("alerta");
  });

  it("con solo_en_alerta devuelve únicamente los insumos bajo el punto de reorden", async () => {
    const out = await ejecutar({ solo_en_alerta: true });

    expect(out.total).toBe(1);
    expect(out.stock.every((s) => s.estado === "alerta")).toBe(true);
    expect(out.stock[0].insumo).toBe("Guante de nitrilo industrial");
    // el conteo global de alertas sigue disponible aunque se filtre
    expect(out.en_alerta).toBe(1);
  });
});
