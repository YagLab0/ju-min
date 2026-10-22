// Tests del agente por su interfaz (costura 2 de la spec): entra una
// consulta de la minera y salen cero o más recomendaciones persistidas.
// La implementación guionada es determinística; cuando llegue el LLM detrás
// de la misma interfaz, estos tests siguen valiendo como contrato del
// respaldo.

import { describe, expect, it } from "vitest";

import { listarHistorialConsultas } from "@/lib/compras";
import { consultarAlAgente } from "./index";

const ID_GUANTE = "10000000-0000-4000-8000-000000000001";
const ID_CIANURO = "10000000-0000-4000-8000-000000000007";
const ID_OFERTA_GUANTE_ANDINA = "0f000000-0000-4000-8000-000000000001";
const ID_OFERTA_ACEITE_BOMBAQ = "0f000000-0000-4000-8000-000000000008";
const ID_OFERTA_CORREA_BOMBAQ = "0f000000-0000-4000-8000-000000000023";
const ID_ANDINA = "f0000000-0000-4000-8000-000000000001";
const ID_LUBRINOA = "f0000000-0000-4000-8000-000000000002";
const ID_BOMBAQ = "f0000000-0000-4000-8000-000000000007";
const ID_REPUCALI = "f0000000-0000-4000-8000-000000000013";

describe("consulta desde una alerta de stock", () => {
  it("recomienda una oferta existente de un proveedor verificado", async () => {
    const consulta = await consultarAlAgente({
      mensaje: "Reponer Guante de nitrilo industrial",
      insumoId: ID_GUANTE,
    });

    expect(consulta.recomendaciones.length).toBeGreaterThan(0);
    const rec = consulta.recomendaciones[0];
    expect(rec.ofertaId).toBe(ID_OFERTA_GUANTE_ANDINA);
    expect(rec.proveedorId).toBe(ID_ANDINA);
    expect(rec.insumoId).toBe(ID_GUANTE);
    expect(rec.estado).toBe("pendiente");
  });

  it("la justificación menciona precio, lead time y trust score", async () => {
    const consulta = await consultarAlAgente({
      mensaje: "Reponer guantes",
      insumoId: ID_GUANTE,
    });

    const j = consulta.recomendaciones[0].justificacion;
    // Andina: $3.800 el par, entrega en 7 días, trust score 91
    expect(j).toContain("3.800");
    expect(j).toMatch(/7\s+d[ií]as/);
    expect(j).toContain("91");
  });

  it("aplica la regla de elección de forma determinística", async () => {
    const entrada = {
      mensaje: "Reponer guantes",
      insumoId: ID_GUANTE,
    };
    const a = await consultarAlAgente(entrada);
    const b = await consultarAlAgente(entrada);

    expect(a.recomendaciones.map((r) => r.ofertaId)).toEqual(
      b.recomendaciones.map((r) => r.ofertaId),
    );
    expect(a.recomendaciones.map((r) => r.justificacion)).toEqual(
      b.recomendaciones.map((r) => r.justificacion),
    );
  });
});

describe("regla de elección de la implementación guionada", () => {
  it("descarta al mejor en las señales si un requisito obligatorio venció", async () => {
    // Aceite 15W-40: LubriNOA domina en trust score (87), lead time (5 días)
    // y precio ($9.800), pero su ISO 9001 — requisito obligatorio de la
    // categoría Lubricantes — venció el 2026-07-31 → descartada. Gana
    // BombaQ: homologado, requisitos vigentes, $10.400 y 12 días.
    const consulta = await consultarAlAgente({
      mensaje: "necesito aceite lubricante",
    });

    expect(consulta.recomendaciones).toHaveLength(1);
    expect(consulta.recomendaciones[0].proveedorId).toBe(ID_BOMBAQ);
    expect(consulta.recomendaciones[0].ofertaId).toBe(ID_OFERTA_ACEITE_BOMBAQ);
    expect(consulta.recomendaciones[0].proveedorId).not.toBe(ID_LUBRINOA);
  });

  it("solo recomienda proveedores homologados, aunque haya ofertas de otros", async () => {
    // Correa EP500: RepuCali está validado (no homologado) → descartado;
    // queda BombaQ, homologado, pese a su mayor lead time.
    const consulta = await consultarAlAgente({
      mensaje: "reponer la correa transportadora",
    });

    const proveedores = consulta.recomendaciones.map((r) => r.proveedorId);
    expect(proveedores).not.toContain(ID_REPUCALI);
    expect(consulta.recomendaciones[0].ofertaId).toBe(ID_OFERTA_CORREA_BOMBAQ);
    expect(consulta.recomendaciones[0].proveedorId).toBe(ID_BOMBAQ);
  });

  it("sin homologados con requisitos cumplidos: cero recomendaciones con motivo", async () => {
    // Filtro de aceite: FiltroPuna y RepuCali tienen ofertas, pero ambos
    // están validados, no homologados.
    const consulta = await consultarAlAgente({
      mensaje: "reponer filtros de aceite",
    });

    expect(consulta.recomendaciones).toHaveLength(0);
    expect(consulta.respuesta).toMatch(/homologad/i);
  });
});

describe("consultas libres", () => {
  it("una consulta reconocible produce recomendaciones", async () => {
    const consulta = await consultarAlAgente({
      mensaje: "¿quién me entrega guantes más rápido?",
    });

    expect(consulta.recomendaciones.length).toBeGreaterThan(0);
    expect(consulta.recomendaciones[0].insumoId).toBe(ID_GUANTE);
    expect(consulta.respuesta).toBeTruthy();
  });

  it("una consulta no reconocible produce cero recomendaciones con motivo", async () => {
    const consulta = await consultarAlAgente({
      mensaje: "¿cómo está el clima en el salar?",
    });

    expect(consulta.recomendaciones).toHaveLength(0);
    expect(consulta.respuesta).toBeTruthy();
  });

  it("una oferta sin disponibilidad no se recomienda", async () => {
    const consulta = await consultarAlAgente({
      mensaje: "reponer floculante",
    });

    expect(consulta.recomendaciones).toHaveLength(0);
    expect(consulta.respuesta).toMatch(/disponib/i);
  });

  it("un insumo sin insumoId explícito también se resuelve por texto", async () => {
    const consulta = await consultarAlAgente({
      mensaje: "necesito cianuro de sodio",
    });

    expect(consulta.recomendaciones.length).toBeGreaterThan(0);
    expect(consulta.recomendaciones[0].insumoId).toBe(ID_CIANURO);
  });

  it("rechaza la consulta sin mensaje ni insumo", async () => {
    await expect(consultarAlAgente({ mensaje: "  " })).rejects.toThrow();
  });
});

describe("persistencia en la sesión del demo", () => {
  it("la consulta y sus recomendaciones quedan en el historial", async () => {
    const consulta = await consultarAlAgente({
      mensaje: "Reponer guantes",
      insumoId: ID_GUANTE,
    });

    const historial = await listarHistorialConsultas();
    const guardada = historial.find((c) => c.id === consulta.id);
    expect(guardada).toBeDefined();
    expect(guardada!.recomendaciones.map((r) => r.id).sort()).toEqual(
      consulta.recomendaciones.map((r) => r.id).sort(),
    );
    // la consulta recién hecha es la más reciente del historial
    expect(historial[0].id).toBe(consulta.id);
  });
});
