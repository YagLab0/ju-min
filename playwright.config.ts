import { existsSync } from "node:fs";
import { homedir } from "node:os";
import { defineConfig } from "@playwright/test";

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

/**
 * Test E2E de desarrollo contra la app real: levanta `pnpm dev` (Next + agente
 * eve) y ejerce /panel en Chromium. Corre contra Gemini con la key de
 * .env.local; no es test de CI.
 */
export default defineConfig({
  testDir: "./e2e",
  timeout: 180_000,
  expect: {
    // La primera respuesta del agente puede tardar: eve arranca la sesión y
    // Gemini resuelve el turno con streaming.
    timeout: 120_000,
  },
  use: {
    baseURL: "http://localhost:3000",
  },
  webServer: {
    command: "pnpm dev",
    url: "http://localhost:3000/eve/v1/health",
    reuseExistingServer: true,
    // La primera request a /eve tarda unos segundos mientras eve arranca.
    timeout: 180_000,
  },
  projects: [{ name: "chromium", use: { browserName: "chromium" } }],
});
