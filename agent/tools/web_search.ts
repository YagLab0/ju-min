import { disableTool } from "eve/tools";

// TEMPORAL para verificación del ticket 01: el tool por defecto web_search
// inyecta googleSearch (grounding) en cada llamada al modelo y la API key
// actual no tiene cuota de grounding (todas las llamadas responden 429
// RESOURCE_EXHAUSTED). Sin este archivo ningún turno del agente completa.
export default disableTool();
