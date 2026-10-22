import { existsSync } from "node:fs";
import { homedir } from "node:os";
import { defineConfig, devices } from "@playwright/test";

// Chromium de Playwright necesita libs de sistema (nss, nspr, asound) que en
// este WSL no están instaladas y `playwright install --with-deps` requiere
// sudo. Workaround sin root: `apt-get download` + `dpkg-deb -x` en
// ~/.cache/ju-min-pw-libs/root (ver README de esa carpeta). Si el dir existe,
// se antepone a LD_LIBRARY_PATH para el proceso que lanza el browser.
const pwLibs = `${homedir()}/.cache/ju-min-pw-libs/root/usr/lib/x86_64-linux-gnu`;
if (existsSync(pwLibs)) {
  process.env.LD_LIBRARY_PATH = process.env.LD_LIBRARY_PATH
    ? `${pwLibs}:${process.env.LD_LIBRARY_PATH}`
    : pwLibs;
}

// Dos modos:
// - Por defecto: build de producción en un puerto dedicado, sin red externa.
//   `next dev` no admite dos instancias por proyecto y un `pnpm dev` abierto a
//   mano podría quedar escuchando en :3000 con otro estado en memoria. El
//   puerto se puede sobreescribir con JUMIN_E2E_PORT.
// - JUMIN_E2E_LLM=1 (`pnpm test:e2e:llm`): levanta `pnpm dev` (Next + agente
//   eve) y corre solo el chat contra Gemini con la key de .env.local. No es
//   test de CI: eve solo acepta requests del navegador en desarrollo.
const conLlm = !!process.env.JUMIN_E2E_LLM;
const puerto = conLlm ? "3000" : (process.env.JUMIN_E2E_PORT ?? "3200");
const baseURL = `http://localhost:${puerto}`;
// Specs que necesitan el agente eve + Gemini reales: solo en el modo LLM.
const testsLlm = ["panel-consulta.spec.ts", "agente-reglas.spec.ts"];

export default defineConfig({
  testDir: "./e2e",
  ...(conLlm ? { testMatch: testsLlm } : { testIgnore: testsLlm }),
  fullyParallel: !conLlm,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  reporter: "list",
  timeout: conLlm ? 180_000 : 30_000,
  expect: {
    // La primera respuesta del agente puede tardar: eve arranca la sesión y
    // Gemini resuelve el turno con streaming.
    timeout: conLlm ? 120_000 : 5_000,
  },
  use: {
    baseURL,
    trace: "on-first-retry",
  },
  projects: [{ name: "chromium", use: { ...devices["Desktop Chrome"] } }],
  webServer: conLlm
    ? {
        command: "pnpm dev",
        url: `${baseURL}/eve/v1/health`,
        reuseExistingServer: true,
        // La primera request a /eve tarda unos segundos mientras eve arranca.
        timeout: 180_000,
      }
    : {
        command: `pnpm build && pnpm start --port ${puerto}`,
        url: baseURL,
        reuseExistingServer: !process.env.CI,
        timeout: 180_000,
        // El E2E por defecto es determinista y sin red: fuerza el seed en
        // memoria para no pagar el sondeo de Supabase ni depender de la LAN.
        env: { JUMIN_FUENTE_DATOS: "memoria" },
      },
});
