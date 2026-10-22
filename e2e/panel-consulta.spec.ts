import { expect, test } from "@playwright/test";

import { ingresarAlDemo } from "./auth";

const consulta = "¿Qué es Jumin? Respondé en una sola oración.";

test("enviar una consulta en /panel produce una respuesta del agente", async ({
  page,
}) => {
  await ingresarAlDemo(page);

  const composer = page.getByRole("textbox", { name: "Escribí tu consulta" });
  await composer.fill(consulta);
  await page.getByRole("button", { name: "Enviar consulta" }).click();

  // El agente responde con texto visible (no se afirma el contenido exacto:
  // Gemini es no determinístico).
  const respuesta = page.locator('[data-role="assistant"]').last();
  await expect(respuesta).toContainText(/\S/);

  // Esperar a que el turno termine antes de recargar: el botón de enviar
  // vuelve a aparecer cuando el agente deja de procesar.
  await expect(
    page.getByRole("button", { name: "Enviar consulta" }),
  ).toBeVisible();

  // Al recargar, la consulta se restaura desde la sesión durable de eve
  // (cursor persistido en localStorage).
  await page.reload();
  await expect(page.getByText(consulta)).toBeVisible();
  await expect(
    page.locator('[data-role="assistant"]').last(),
  ).toContainText(/\S/);
});
