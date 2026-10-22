import { describe, expect, it } from "vitest";

import { verificarCredenciales } from "./credenciales";
import { firmarSesion, verificarSello } from "./sello";

describe("verificarCredenciales (seed demo)", () => {
  it("acepta un usuario del seed con su clave", async () => {
    const usuario = await verificarCredenciales(
      "admin@salesdejujuy.ju-min.local",
      "ju-min-demo",
    );
    expect(usuario?.rol).toBe("admin");
    expect(usuario?.minera).toBe("Sales de Jujuy S.A.");
  });

  it("normaliza el email (espacios y mayúsculas)", async () => {
    const usuario = await verificarCredenciales(
      "  COMPRADOR@salesdejujuy.ju-min.local ",
      "ju-min-demo",
    );
    expect(usuario?.rol).toBe("comprador");
  });

  it("rechaza clave incorrecta y email inexistente", async () => {
    await expect(
      verificarCredenciales("admin@salesdejujuy.ju-min.local", "otra-clave"),
    ).resolves.toBeNull();
    await expect(
      verificarCredenciales("nadie@ju-min.local", "ju-min-demo"),
    ).resolves.toBeNull();
  });

  it("cae al seed local cuando Supabase está configurado pero no responde", async () => {
    const urlPrev = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const keyPrev = process.env.SUPABASE_SERVICE_ROLE_KEY;
    // Puerto 1: conexión rechazada al instante, sin salir a la red.
    process.env.NEXT_PUBLIC_SUPABASE_URL = "http://127.0.0.1:1";
    process.env.SUPABASE_SERVICE_ROLE_KEY = "test";
    try {
      const usuario = await verificarCredenciales(
        "aprobador@salesdejujuy.ju-min.local",
        "ju-min-demo",
      );
      expect(usuario?.rol).toBe("aprobador");
    } finally {
      if (urlPrev === undefined) delete process.env.NEXT_PUBLIC_SUPABASE_URL;
      else process.env.NEXT_PUBLIC_SUPABASE_URL = urlPrev;
      if (keyPrev === undefined) delete process.env.SUPABASE_SERVICE_ROLE_KEY;
      else process.env.SUPABASE_SERVICE_ROLE_KEY = keyPrev;
    }
  });
});

describe("sello de sesión", () => {
  const payload = {
    sub: "u-1",
    nombre: "Julián Paredes",
    email: "comprador@salesdejujuy.ju-min.local",
    rol: "comprador" as const,
  };

  it("firma y verifica un token válido", async () => {
    const token = await firmarSesion(payload, 60);
    const sesion = await verificarSello(token);
    expect(sesion).toMatchObject(payload);
  });

  it("rechaza un token adulterado", async () => {
    const token = await firmarSesion(payload, 60);
    const [json, firma] = token.split(".");
    await expect(verificarSello(`${json}x.${firma}`)).resolves.toBeNull();
    const otro = await firmarSesion({ ...payload, nombre: "Otro" }, 60);
    await expect(
      verificarSello(`${json}.${otro.split(".")[1]}`),
    ).resolves.toBeNull();
  });

  it("rechaza tokens vencidos y malformados", async () => {
    const vencido = await firmarSesion(payload, -10);
    await expect(verificarSello(vencido)).resolves.toBeNull();
    await expect(verificarSello("sin-formato")).resolves.toBeNull();
    await expect(verificarSello("")).resolves.toBeNull();
    await expect(verificarSello(undefined)).resolves.toBeNull();
    await expect(verificarSello("cuerpo.firma")).resolves.toBeNull();
  });
});
