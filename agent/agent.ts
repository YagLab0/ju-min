import { google } from "@ai-sdk/google";
import { defineAgent } from "eve";

export default defineAgent({
  model: google("gemini-3.8-flash"),
  modelContextWindowTokens: 1_048_576,
});
