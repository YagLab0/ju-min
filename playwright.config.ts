import { defineConfig, devices } from "@playwright/test";

// Los tests sirven el build de producción en un puerto dedicado: `next dev`
// no admite dos instancias por proyecto y un `pnpm dev` abierto a mano
// podría quedar escuchando en :3000 con otro estado en memoria.
// El puerto se puede sobreescribir con JUMIN_E2E_PORT si estuviera ocupado.
const puerto = process.env.JUMIN_E2E_PORT ?? "3200";
const baseURL = `http://localhost:${puerto}`;

export default defineConfig({
  testDir: "./e2e",
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  reporter: "list",
  use: {
    baseURL,
    trace: "on-first-retry",
  },
  projects: [{ name: "chromium", use: { ...devices["Desktop Chrome"] } }],
  webServer: {
    command: `pnpm build && pnpm start --port ${puerto}`,
    url: baseURL,
    reuseExistingServer: !process.env.CI,
    timeout: 180_000,
  },
});
