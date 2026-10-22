import { disableTool } from "eve/tools";

// NOTA (ticket 01 — fuera del alcance estricto del spec, a revisar por el
// equipo): deshabilita el tool por defecto web_search. Eve lo inyecta como
// googleSearch (grounding) en TODA llamada al modelo y la API key actual no
// tiene cuota de grounding: cada llamada respondía 429 RESOURCE_EXHAUSTED y
// el agente no podía responder nada. Además, una búsqueda web general
// contradice el dominio acotado del consultor. Si se habilita cuota de
// grounding o el equipo decide conservar web_search, borrar este archivo.
export default disableTool();
