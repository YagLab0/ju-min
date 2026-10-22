import { defineTool } from "eve/tools";
import { z } from "zod";
import { getSupabase, rel, rows } from "../lib/supabase";

interface InsumoRow {
  id: string;
  nombre: string;
  unidad: string;
  especificacion: string | null;
  categorias: unknown;
}

export default defineTool({
  description:
    "Lista los insumos del catálogo con su categoría, unidad y especificación. " +
    "Usala para encontrar el id de un insumo o responder qué insumos consume la minera.",
  inputSchema: z.object({
    busqueda: z
      .string()
      .optional()
      .describe("Texto para filtrar por nombre de insumo (ej. 'guante', 'lubricante')."),
  }),
  async execute({ busqueda }) {
    const supabase = getSupabase();
    let query = supabase
      .from("insumos")
      .select("id, nombre, unidad, especificacion, categorias(nombre)")
      .order("nombre");
    if (busqueda) query = query.ilike("nombre", `%${busqueda}%`);
    const { data, error } = await query.limit(100);
    if (error) throw new Error(`Error consultando insumos: ${error.message}`);
    const insumos = rows<InsumoRow>(data).map((row) => ({
      id: row.id,
      nombre: row.nombre,
      unidad: row.unidad,
      especificacion: row.especificacion,
      categoria: rel<{ nombre: string }>(row.categorias)?.nombre ?? null,
    }));
    return { total: insumos.length, insumos };
  },
});
