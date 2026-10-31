import { createOpenAICompatible } from "@ai-sdk/openai-compatible";
import { defineAgent } from "eve";

// OpenCode Go (suscripción): la base URL difiere del pay-as-you-go
// (/inference/go/...) y el gateway exige dos cosas del cliente:
//   - x-opencode-session: ID estable por conversación para routing y caché
//     de prompts (acá va uno por proceso; lo ideal sería por sesión de eve)
//   - un user-agent propio, no el genérico del SDK
// Sin el header responde 400 MissingSessionID.
const zen = createOpenAICompatible({
  name: "opencode-go",
  baseURL: "https://opencode.ai/inference/go/openai/v1",
  apiKey: process.env.OPENCODE_API_KEY,
  headers: {
    "x-opencode-session": crypto.randomUUID(),
    "user-agent": "ju-min/1.0",
  },
});

// El modelo sale de OPENCODE_MODEL (IDs del catálogo Go:
// GET https://opencode.ai/zen/go/v1/models). Default beam-free: el modelo
// gratis del plan ($0 por token, "limited time" según la doc). Atención:
// algunos modelos piden toggles en Settings › Privacy (deepseek-* → región
// Global; *-contributor → endpoints que entrenan con datos).
export default defineAgent({
  model: zen(process.env.OPENCODE_MODEL ?? "beam-free"),
  modelContextWindowTokens: 128_000,
});
