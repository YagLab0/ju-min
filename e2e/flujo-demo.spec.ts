import { expect, test } from "@playwright/test";

import { CLAVE_DEMO, EMAIL_DEMO } from "./auth";

// El estado del demo vive en memoria del servidor y se acumula entre
// requests: las aserciones apuntan siempre a la consulta que este test crea
// (la última respuesta del agente), nunca a conteos globales.

test.describe("flujo completo del demo", () => {
  test("alerta de stock → agente → ficha → contacto simulado → aprobación", async ({
    page,
  }) => {
    // 1. Entrar a la landing y de ahí al panel de la minera (pide login).
    await page.goto("/");
    await expect(
      page.getByRole("heading", { level: 1, name: /punto de reorden/ }),
    ).toBeVisible();
    await page
      .getByRole("link", { name: "Abrir el panel de la minera" })
      .click();
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

    // 3. Consultar al agente directamente desde la alerta.
    await tarjetaAlerta
      .getByRole("button", { name: "Consultar al agente" })
      .click();

    // 4. La respuesta del agente trae la recomendación pendiente.
    const ultimaRespuesta = page.getByRole("article", {
      name: "Última respuesta del agente",
    });
    await expect(ultimaRespuesta).toContainText(
      "Reponer Guante de nitrilo industrial",
    );
    const recomendacion = ultimaRespuesta
      .getByRole("listitem")
      .filter({ hasText: "Andina EPP" });
    await expect(recomendacion).toContainText("Pendiente");
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

    // 7. Volver al panel y aprobar la recomendación.
    await page.goBack();
    await expect(page).toHaveURL("/panel");
    await ultimaRespuesta
      .getByRole("button", { name: "Aprobar" })
      .click();
    await expect(recomendacion).toContainText("Aprobada");

    // 8. El historial registra la consulta con la recomendación aprobada.
    const historial = page.getByRole("region", {
      name: "Historial de consultas",
    });
    const consultaDelDemo = historial
      .getByRole("listitem")
      .filter({
        has: page.getByRole("heading", {
          name: /Reponer Guante de nitrilo industrial/,
        }),
      })
      .first();
    await expect(consultaDelDemo).toContainText("Aprobada");
  });
});

test.describe("landing con movimiento reducido", () => {
  test.use({ reducedMotion: "reduce" });

  test("el estante queda en pose fija o muestra el respaldo SVG", async ({
    page,
  }) => {
    await page.goto("/");
    const figura = page.getByRole("figure", { name: /punto de reorden/ });
    await expect(figura).toBeVisible();

    // Con prefers-reduced-motion la pieza no anima: si WebGL está disponible
    // el canvas renderiza la pose fija de alerta (data-rendered) y el
    // respaldo se oculta; si no hay WebGL, queda visible el SVG de respaldo.
    // En ningún caso queda un hueco en blanco.
    const poseFija = figura.locator("[data-rendered='true']");
    await poseFija
      .waitFor({ state: "attached", timeout: 15_000 })
      .catch(() => {});
    await expect(figura.locator("svg")).toBeVisible({
      visible: (await poseFija.count()) === 0,
    });
  });
});
