import { createAnthropic } from "@ai-sdk/anthropic";
import { defineAgent } from "eve";

// API keys de Anthropic de nivel organización requieren el header
// anthropic-workspace-id; si está ANTHROPIC_WORKSPACE_ID se envía, si no la
// key se usa tal cual (para keys scoped a un workspace no hace falta).
const anthropic = createAnthropic({
  headers: process.env.ANTHROPIC_WORKSPACE_ID
    ? { "anthropic-workspace-id": process.env.ANTHROPIC_WORKSPACE_ID }
    : undefined,
});

export default defineAgent({
  model: anthropic("claude-haiku-5-5"),
  modelContextWindowTokens: 200_000,
});
