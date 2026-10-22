import { expect, type Page } from "@playwright/test";

/** Credenciales del seed demo (src/lib/auth/usuarios.ts). */
export const EMAIL_DEMO = "comprador@salesdejujuy.ju-min.local";
export const CLAVE_DEMO = "ju-min-demo";

/** Login por la UI real: llena el formulario de /login y espera el redirect
 * al panel. Las rutas protegidas exigen la cookie de sesión. */
export async function ingresarAlDemo(page: Page): Promise<void> {
  await page.goto("/login");
  await page.getByLabel("Email").fill(EMAIL_DEMO);
  await page.getByLabel("Contraseña").fill(CLAVE_DEMO);
  await page.getByRole("button", { name: "Ingresar" }).click();
  await expect(page).toHaveURL("/panel");
}
