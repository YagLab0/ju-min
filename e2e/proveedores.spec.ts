import { expect, test } from "@playwright/test";

import { ingresarAlDemo } from "./auth";

test.describe("explorer de proveedores verificados", () => {
  test.beforeEach(async ({ page }) => {
    // La red verificada es una ruta protegida: se ingresa por el login.
    await ingresarAlDemo(page);
  });

  test("muestra la red verificada completa", async ({ page }) => {
    await page.goto("/proveedores");

    await expect(page).toHaveURL("/proveedores");
    await expect(page.getByRole("article")).toHaveCount(16);
    await expect(
      page.getByText("16 proveedores verificados"),
    ).toBeVisible();
  });

  test("filtrar por categoría reduce el listado", async ({ page }) => {
    await page.goto("/proveedores");

    await page
      .getByLabel("Categoría")
      .selectOption("Filtros industriales");
    await page.getByRole("button", { name: "Aplicar filtros" }).click();

    await expect(page).toHaveURL(/categoria=/);
    await expect(page.getByRole("article")).toHaveCount(2);
    await expect(page.getByText("2 de 16 proveedores")).toBeVisible();
  });

  test("buscar por nombre acota el listado", async ({ page }) => {
    await page.goto("/proveedores");

    await page.getByLabel("Buscar por nombre").fill("puna");
    await page.getByRole("button", { name: "Aplicar filtros" }).click();

    await expect(page).toHaveURL(/busqueda=puna/);
    await expect(page.getByRole("article")).toHaveCount(3);
  });

  test("orden ascendente pone primero el menor trust score", async ({
    page,
  }) => {
    await page.goto("/proveedores");

    await page.getByLabel("Ordenar por").selectOption("Menor trust score");
    await page.getByRole("button", { name: "Aplicar filtros" }).click();

    await expect(page).toHaveURL(/orden=trust_score_asc/);
    await expect(
      page.getByRole("article").first().getByRole("heading"),
    ).toContainText("RepuCali");
  });

  test("estado vacío explica cómo ampliar la búsqueda", async ({ page }) => {
    await page.goto("/proveedores");

    await page.getByLabel("Buscar por nombre").fill("noexiste");
    await page.getByRole("button", { name: "Aplicar filtros" }).click();

    await expect(
      page.getByRole("heading", {
        name: "Ningún proveedor verificado coincide",
      }),
    ).toBeVisible();
    await expect(page.getByText(/ampliar la búsqueda/)).toBeVisible();
    await expect(
      page.getByRole("link", { name: "Ver todos los proveedores" }),
    ).toBeVisible();
  });
});
