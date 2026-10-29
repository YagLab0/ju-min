import { expect, test } from "@playwright/test";

import { CLAVE_DEMO, EMAIL_DEMO } from "./auth";

// El estado del demo vive en memoria del servidor y se acumula entre
// requests: las aserciones apuntan siempre a la recomendación que este test
// crea (Andina EPP para el guante de nitrilo), nunca a conteos globales.

test.describe("flujo completo del demo", () => {
  test("alerta de stock → agente → ficha → contacto simulado → informe PDF", async ({
    page,
  }) => {
    // 1. Entrar a la landing y de ahí al panel de la minera (pide login).
    await page.goto("/");
    await page.locator('main a[href="/panel"]').first().click();
    // El panel es privado: el proxy manda a /login con la ruta original
    // en `desde` y el login la retoma.
    await page.getByLabel("Email").fill(EMAIL_DEMO);
    await page.getByLabel("Contraseña").fill(CLAVE_DEMO);
    await page.getByRole("button", { name: "Ingresar" }).click();
    await expect(page).toHaveURL("/panel");

    // 2. El panel arranca con la alerta de stock del demo.
    const alertas = page.getByRole("region", {
      name: /por debajo del punto de reorden/,
    });
    const tarjetaAlerta = alertas
      .getByRole("listitem")
      .filter({
        has: page.getByRole("heading", {
          name: "Guante de nitrilo industrial",
        }),
      });
    await expect(tarjetaAlerta).toContainText("En alerta");
    await expect(tarjetaAlerta).toContainText("días de stock");

    // 3. Pedir la recomendación al agente directamente desde la alerta.
    await tarjetaAlerta
      .getByRole("button", { name: "Pedir recomendación" })
      .click();

    // 4. La recomendación nueva aparece en «Recomendaciones».
    const cola = page.getByRole("region", { name: "Recomendaciones" });
    // El seed trae otra recomendación de Andina EPP para el mismo insumo: la
    // que este test crea se distingue por la justificación generada por el
    // agente («Puntaje combinado…»).
    const recomendacion = cola
      .getByRole("listitem")
      .filter({ hasText: "Andina EPP" })
      .filter({ hasText: "Puntaje combinado" });
    await expect(recomendacion).toContainText("Guante de nitrilo industrial");
    await expect(recomendacion).toContainText("7 días");
    await expect(recomendacion).toContainText("91/100");

    // 5. De la recomendación a la ficha del proveedor verificado.
    await recomendacion
      .getByRole("link", { name: "Andina EPP" })
      .click();
    await expect(page).toHaveURL(/\/proveedores\/.+/);
    await expect(
      page.getByRole("heading", { level: 1, name: "Andina EPP" }),
    ).toBeVisible();
    await expect(
      page.getByText("Homologado", { exact: true }),
    ).toBeVisible();

    // 6. Contacto simulado: el modal confirma sin enviar nada.
    await page
      .getByRole("button", { name: "Contactar al proveedor" })
      .click();
    // El título del diálogo cambia al confirmar; se toma por rol, no por nombre.
    const dialogo = page.getByRole("dialog");
    await expect(
      dialogo.getByRole("heading", { name: "Contactar a Andina EPP" }),
    ).toBeVisible();
    await dialogo
      .getByRole("button", { name: "Confirmar contacto" })
      .click();
    await expect(
      dialogo.getByRole("heading", { name: "Contacto registrado" }),
    ).toBeVisible();
    await dialogo.getByRole("button", { name: "Cerrar" }).click();
    await expect(dialogo).toBeHidden();

    // 7. Volver al panel y descargar el informe PDF de la recomendación.
    await page.goBack();
    await expect(page).toHaveURL("/panel");
    const [descarga] = await Promise.all([
      page.waitForEvent("download"),
      recomendacion
        .getByRole("button", { name: "Descargar informe (PDF)" })
        .click(),
    ]);
    const archivo = descarga.suggestedFilename();
    expect(archivo).toMatch(/^informe-JM-[0-9A-Z]{4}-[0-9A-Z]{4}-[0-9A-Z]{4}\.pdf$/);
    const codigo = archivo.replace(/^informe-/, "").replace(/\.pdf$/, "");

    // La descarga no recarga el panel: al volver a cargarlo, la
    // recomendación muestra el código de su informe.
    await page.reload();
    await expect(recomendacion).toContainText(codigo);

    // 8. Un auditor verifica el informe por su código, sin sesión.
    await page.goto(`/verificar?codigo=${codigo}`);
    await expect(page.getByRole("status")).toContainText("Informe auténtico");
    await expect(page.getByRole("status")).toContainText(
      "Andina de Seguridad Industrial S.R.L.",
    );
  });
});

test.describe("landing con movimiento reducido", () => {
  test.use({ reducedMotion: "reduce" });

  test("el estante queda en pose fija o muestra el render de respaldo", async ({
    page,
  }) => {
    await page.goto("/");
    const figura = page.getByRole("figure");
    await expect(figura).toBeVisible();

    // Con prefers-reduced-motion la pieza no anima: si WebGL está disponible
    // el canvas renderiza la pose fija de alerta (data-rendered) y el
    // respaldo se oculta; si no hay WebGL, queda visible el render estático.
    // En ningún caso queda un hueco en blanco.
    const poseFija = figura.locator("[data-rendered='true']");
    await poseFija
      .waitFor({ state: "attached", timeout: 15_000 })
      .catch(() => {});
    await expect(figura.locator("canvas").locator("..").locator("img")).toBeVisible({
      visible: (await poseFija.count()) === 0,
    });
  });
});
