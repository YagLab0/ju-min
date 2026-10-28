import { createOpenAICompatible } from "@ai-sdk/openai-compatible";
import { defineAgent } from "eve";

// OpenCode Zen como proveedor del modelo: gateway que expone endpoints
// nativos por provider bajo /inference/<proveedor>/v1. DeepSeek va por la
// API OpenAI-compatible (/chat/completions) y se autentica con
// OPENCODE_API_KEY (opencode.ai/console).
const zen = createOpenAICompatible({
  name: "opencode-zen",
  baseURL: "https://opencode.ai/inference/openai/v1",
  apiKey: process.env.OPENCODE_API_KEY,
});

export default defineAgent({
  model: zen("deepseek-v4.1-flash"),
  modelContextWindowTokens: 128_000,
});
