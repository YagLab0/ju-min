import { expect, test } from "@playwright/test";

import { CLAVE_DEMO, EMAIL_DEMO, ingresarAlDemo } from "./auth";

test.describe("autenticación del demo", () => {
  test("sin sesión, /panel redirige a /login y el login vuelve al panel", async ({
    page,
  }) => {
    await page.goto("/panel");
    await expect(page).toHaveURL(/\/login\?desde=/);

    await page.getByLabel("Email").fill(EMAIL_DEMO);
    await page.getByLabel("Contraseña").fill(CLAVE_DEMO);
    await page.getByRole("button", { name: "Ingresar" }).click();

    // El redirect de la ruta protegida original se conserva en `desde`.
    await expect(page).toHaveURL("/panel");
    await expect(
      page.getByRole("heading", { name: "Panel de la minera" }),
    ).toBeVisible();
  });

  test("credenciales incorrectas muestran el error y no sellan sesión", async ({
    page,
  }) => {
    await page.goto("/login");
    await page.getByLabel("Email").fill(EMAIL_DEMO);
    await page.getByLabel("Contraseña").fill("clave-incorrecta");
    await page.getByRole("button", { name: "Ingresar" }).click();

    await expect(
      page.getByText("Email o contraseña incorrectos"),
    ).toBeVisible();
    await expect(page).toHaveURL(/\/login/);
  });

  test("sin sesión, /proveedores también redirige a /login", async ({
    page,
  }) => {
    await page.goto("/proveedores");
    await expect(page).toHaveURL(/\/login\?desde=/);
  });

  test("con sesión, /login redirige al panel y Cerrar sesión la cierra", async ({
    page,
  }) => {
    await ingresarAlDemo(page);

    await page.goto("/login");
    await expect(page).toHaveURL("/panel");

    await page
      .getByRole("button", { name: "Cerrar sesión" })
      .click();
    await expect(page).toHaveURL("/login");

    // La sesión quedó borrada: el panel vuelve a pedir login.
    await page.goto("/panel");
    await expect(page).toHaveURL(/\/login\?desde=/);
  });
});
