import { expect, test } from "@playwright/test";

import { ingresarAlDemo } from "./auth";

test.describe("catálogo de insumos", () => {
  test.beforeEach(async ({ page }) => {
    // El catálogo es una ruta protegida: se ingresa por el login.
    await ingresarAlDemo(page);
  });

  test("muestra el catálogo completo con el resumen de ofertas", async ({
    page,
  }) => {
    await page.goto("/insumos");

    await expect(page.getByRole("article")).toHaveCount(15);
    await expect(page.getByText("15 insumos")).toBeVisible();
    const guante = page.getByRole("article").filter({
      has: page.getByRole("heading", { name: "Guante de nitrilo industrial" }),
    });
    await expect(guante).toContainText("2 ofertas");
    await expect(guante).toContainText("Entrega desde 7 días");
  });

  test("filtrar por categoría reduce el listado", async ({ page }) => {
    await page.goto("/insumos");

    await page.getByLabel("Categoría").selectOption("Filtros industriales");
    await page.getByRole("button", { name: "Aplicar filtros" }).click();

    await expect(page).toHaveURL(/categoria=/);
    await expect(page.getByRole("article")).toHaveCount(2);
    await expect(page.getByText("2 de 15 insumos")).toBeVisible();
  });

  test("estado vacío explica cómo ampliar la búsqueda", async ({ page }) => {
    await page.goto("/insumos");

    await page.getByLabel("Buscar insumo").fill("noexiste");
    await page.getByRole("button", { name: "Aplicar filtros" }).click();

    await expect(
      page.getByRole("heading", { name: "Ningún insumo coincide" }),
    ).toBeVisible();
    await expect(
      page.getByRole("link", { name: "Ver todos los insumos" }),
    ).toBeVisible();
  });

  test("la ficha compara las ofertas y lleva al proveedor", async ({ page }) => {
    await page.goto("/insumos");

    await page
      .getByRole("article")
      .filter({
        has: page.getByRole("heading", {
          name: "Guante de nitrilo industrial",
        }),
      })
      .getByRole("link", { name: "Comparar ofertas" })
      .click();

    await expect(page).toHaveURL(/\/insumos\/.+/);
    await expect(
      page.getByRole("heading", {
        level: 1,
        name: "Guante de nitrilo industrial",
      }),
    ).toBeVisible();
    const filas = page.getByRole("row");
    // encabezado + dos ofertas, la más barata primero
    await expect(filas).toHaveCount(3);
    await expect(filas.nth(1)).toContainText("Andina EPP");
    await expect(filas.nth(1)).toContainText("Menor precio");
    await expect(filas.nth(1)).toContainText("Entrega más rápida");

    await filas.nth(1).getByRole("link", { name: "Andina EPP" }).click();
    await expect(page).toHaveURL(/\/proveedores\/.+/);
    await expect(
      page.getByRole("heading", { level: 1, name: "Andina EPP" }),
    ).toBeVisible();
  });

  test("un insumo inexistente muestra la página de no encontrado", async ({
    page,
  }) => {
    await page.goto("/insumos/99999999-9999-4999-8999-999999999999");

    await expect(
      page.getByRole("heading", { name: "Insumo no encontrado" }),
    ).toBeVisible();
  });
});
