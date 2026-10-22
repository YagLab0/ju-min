// Tests de la selección de la fuente de datos (index.ts): en modo auto con
// Supabase configurado pero inalcanzable o sin el seed, el módulo cae al
// seed en memoria para que el demo nunca quede en pantalla vacía.

import { afterEach, beforeEach, describe, expect, it, vi } from "vitest";

import type { TablasCompras } from "./fuente-datos";
import { SEMILLA } from "./semilla";

const mocks = vi.hoisted(() => ({ leerTablas: vi.fn() }));

vi.mock("./adaptador-supabase", () => ({
  AdaptadorSupabase: class {
    leerTablas = mocks.leerTablas;
  },
}));

import {
  listarProveedoresVerificados,
  listarStockMinera,
} from "./index";

const ENVS = [
  "JUMIN_FUENTE_DATOS",
  "NEXT_PUBLIC_SUPABASE_URL",
  "SUPABASE_SERVICE_ROLE_KEY",
] as const;

const respaldo: Partial<Record<(typeof ENVS)[number], string | undefined>> = {};

function resetearFuente() {
  (globalThis as Record<string, unknown>).__juMinFuenteCompras = undefined;
}

function tablasVacias(): TablasCompras {
  return { ...structuredClone(SEMILLA), proveedores: [] };
}

beforeEach(() => {
  for (const v of ENVS) {
    respaldo[v] = process.env[v];
    delete process.env[v];
  }
  mocks.leerTablas.mockReset();
  resetearFuente();
  vi.spyOn(console, "warn").mockImplementation(() => {});
  vi.spyOn(console, "info").mockImplementation(() => {});
});

afterEach(() => {
  for (const v of ENVS) {
    if (respaldo[v] === undefined) delete process.env[v];
    else process.env[v] = respaldo[v];
  }
  vi.restoreAllMocks();
  resetearFuente();
});

describe("selección de la fuente de datos", () => {
  it("sin env vars usa el seed en memoria", async () => {
    const proveedores = await listarProveedoresVerificados();
    expect(proveedores.length).toBe(16);
    expect(mocks.leerTablas).not.toHaveBeenCalled();
  });

  it("con Supabase configurado pero inalcanzable cae al seed en memoria", async () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = "http://supabase-caido.test";
    process.env.SUPABASE_SERVICE_ROLE_KEY = "key";
    mocks.leerTablas.mockRejectedValue(new Error("fetch failed"));

    const proveedores = await listarProveedoresVerificados();
    expect(proveedores.length).toBe(16);
    expect(console.warn).toHaveBeenCalledWith(
      expect.stringContaining("seed en memoria"),
    );
  });

  it("con Supabase sin el seed cargado cae al seed en memoria", async () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = "http://supabase-vacio.test";
    process.env.SUPABASE_SERVICE_ROLE_KEY = "key";
    mocks.leerTablas.mockResolvedValue(tablasVacias());

    const stock = await listarStockMinera();
    expect(stock.length).toBe(SEMILLA.stockMinera.length);
    expect(console.warn).toHaveBeenCalledWith(
      expect.stringContaining("seed en memoria"),
    );
  });

  it("con Supabase respondiendo usa sus datos, no el seed", async () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = "http://supabase-ok.test";
    process.env.SUPABASE_SERVICE_ROLE_KEY = "key";
    const tablas = structuredClone(SEMILLA);
    tablas.proveedores = tablas.proveedores.slice(0, 2);
    mocks.leerTablas.mockResolvedValue(tablas);

    const proveedores = await listarProveedoresVerificados();
    expect(proveedores.length).toBe(2);
    expect(mocks.leerTablas).toHaveBeenCalled();
  });

  it("JUMIN_FUENTE_DATOS=memoria ignora Supabase aunque haya env vars", async () => {
    process.env.JUMIN_FUENTE_DATOS = "memoria";
    process.env.NEXT_PUBLIC_SUPABASE_URL = "http://supabase-ok.test";
    process.env.SUPABASE_SERVICE_ROLE_KEY = "key";

    const proveedores = await listarProveedoresVerificados();
    expect(proveedores.length).toBe(16);
    expect(mocks.leerTablas).not.toHaveBeenCalled();
  });

  it("JUMIN_FUENTE_DATOS=supabase propaga el error sin fallback", async () => {
    process.env.JUMIN_FUENTE_DATOS = "supabase";
    process.env.NEXT_PUBLIC_SUPABASE_URL = "http://supabase-caido.test";
    process.env.SUPABASE_SERVICE_ROLE_KEY = "key";
    mocks.leerTablas.mockRejectedValue(new Error("fetch failed"));

    await expect(listarProveedoresVerificados()).rejects.toThrow(
      "fetch failed",
    );
  });
});
