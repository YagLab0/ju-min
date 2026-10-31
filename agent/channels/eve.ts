import { eveChannel } from "eve/channels/eve";
import { type AuthFn, localDev, vercelOidc } from "eve/channels/auth";

import { NOMBRE_COOKIE_SESION, verificarSello } from "@/lib/auth/sello";

/** Mismo login que el panel: el chat vive en /panel (mismo origen), así que
 * el browser manda la cookie firmada ju-min.sesion con cada request a
 * /eve/v1. Sin cookie válida se pasa a la siguiente entrada del walk. */
function sesionApp(): AuthFn<Request> {
  return async (request) => {
    const valor = request.headers
      .get("cookie")
      ?.split(";")
      .map((c) => c.trim())
      .find((c) => c.startsWith(`${NOMBRE_COOKIE_SESION}=`))
      ?.slice(NOMBRE_COOKIE_SESION.length + 1);
    const sesion = await verificarSello(
      valor ? decodeURIComponent(valor) : null,
    );
    if (!sesion) return null;
    return {
      attributes: { rol: sesion.rol, email: sesion.email },
      authenticator: "ju-min-sesion",
      principalId: sesion.sub,
      principalType: "user",
    };
  };
}

export default eveChannel({
  auth: [
    sesionApp(),
    // Lets the eve TUI and your Vercel deployments reach the deployed agent.
    vercelOidc(),
    // Open on localhost for `eve dev` and the REPL; ignored in production.
    localDev(),
  ],
});
