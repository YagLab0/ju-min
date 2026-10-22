import { defineTool } from "eve/tools";
import { always } from "eve/tools/approval";
import { z } from "zod";
import { getSupabase } from "../lib/supabase";

export default defineTool({
  description:
    "Registra una recomendación de compra: propone un insumo de un proveedor " +
    "verificado con su justificación (precio, lead time y trust score). " +
    "Crea la recomendación en estado pendiente vinculada a una consulta. " +
    "Siempre requiere aprobación humana antes de ejecutarse.",
  inputSchema: z.object({
    proveedor_id: z
      .uuid()
      .describe("Proveedor verificado recomendado (de listar_proveedores u listar_ofertas)."),
    insumo_id: z.uuid().describe("Insumo a reponer (de listar_insumos u listar_ofertas)."),
    justificacion: z
      .string()
      .min(10)
      .describe(
        "Por qué se recomienda: debe mencionar precio, lead time y trust score.",
      ),
    mensaje_consulta: z
      .string()
      .optional()
      .describe(
        "Texto de la consulta de la minera que origina la recomendación. " +
          "Si se omite se registra un texto genérico.",
      ),
    puntaje: z
      .number()
      .min(0)
      .max(100)
      .optional()
      .describe("Puntaje opcional de la recomendación (0-100)."),
  }),
  approval: {
    request: always(),
    prompt: ({ input }) =>
      `¿Registrar recomendación de compra? ${input.justificacion}`,
  },
  async execute({ proveedor_id, insumo_id, justificacion, mensaje_consulta, puntaje }) {
    const supabase = getSupabase();

    // recomendaciones.consulta_id es NOT NULL: primero la consulta que la origina.
    const { data: consulta, error: errConsulta } = await supabase
      .from("consultas")
      .insert({
        mensaje:
          mensaje_consulta ??
          "Recomendación de compra propuesta por el agente.",
        estado: "pendiente",
      })
      .select("id")
      .single();
    if (errConsulta)
      throw new Error(`Error creando la consulta: ${errConsulta.message}`);
    const consultaId = (consulta as { id: string }).id;

    const { data: recomendacion, error: errRec } = await supabase
      .from("recomendaciones")
      .insert({
        consulta_id: consultaId,
        proveedor_id,
        insumo_id,
        justificacion,
        puntaje: puntaje ?? null,
      })
      .select("id, consulta_id, proveedor_id, insumo_id, justificacion, puntaje, created_at")
      .single();
    if (errRec)
      throw new Error(`Error registrando la recomendación: ${errRec.message}`);

    return {
      registrada: true,
      estado: "pendiente",
      recomendacion,
      mensaje:
        "Recomendación registrada como pendiente. Una persona debe aprobarla antes de comprar.",
    };
  },
});
