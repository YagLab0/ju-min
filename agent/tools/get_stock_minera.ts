import { defineTool } from "eve/tools";
import { z } from "zod";
import { getSupabase, rel, rows } from "../lib/supabase";

interface StockRow {
  id: string;
  cantidad_actual: number | string;
  punto_reorden: number | string;
  consumo_mensual: number | string | null;
  updated_at: string;
  insumos: unknown;
  mineras: unknown;
}

export default defineTool({
  description:
    "Devuelve el stock de insumos de la minera con su punto de reorden. " +
    "Marca cada fila que está bajo el punto de reorden (faltante o quiebre). " +
    "Si la tabla está vacía devuelve una lista vacía: no hay stock cargado todavía.",
  inputSchema: z.object({
    minera_id: z
      .uuid()
      .optional()
      .describe("Filtrar por una minera puntual. Si se omite, trae el stock de todas."),
    solo_bajo_reorden: z
      .boolean()
      .optional()
      .describe("Si es true, devuelve solo los insumos bajo el punto de reorden."),
  }),
  async execute({ minera_id, solo_bajo_reorden }) {
    const supabase = getSupabase();
    let query = supabase
      .from("stock_minera")
      .select(
        "id, cantidad_actual, punto_reorden, consumo_mensual, updated_at, " +
          "insumos(id, nombre, unidad), mineras(id, nombre)",
      );
    if (minera_id) query = query.eq("minera_id", minera_id);
    const { data, error } = await query;
    if (error) throw new Error(`Error consultando stock: ${error.message}`);

    const items = rows<StockRow>(data).map((row) => {
      const insumo = rel<{ id: string; nombre: string; unidad: string }>(
        row.insumos,
      );
      const minera = rel<{ id: string; nombre: string }>(row.mineras);
      const actual = Number(row.cantidad_actual);
      const reorden = Number(row.punto_reorden);
      return {
        id: row.id,
        minera: minera?.nombre ?? null,
        insumo_id: insumo?.id ?? null,
        insumo: insumo?.nombre ?? null,
        unidad: insumo?.unidad ?? null,
        cantidad_actual: actual,
        punto_reorden: reorden,
        consumo_mensual:
          row.consumo_mensual === null ? null : Number(row.consumo_mensual),
        bajo_punto_reorden: actual <= reorden,
        faltante: Math.max(0, reorden - actual),
        updated_at: row.updated_at,
      };
    });

    const filtrados = solo_bajo_reorden
      ? items.filter((i) => i.bajo_punto_reorden)
      : items;

    return {
      total: filtrados.length,
      total_bajo_reorden: items.filter((i) => i.bajo_punto_reorden).length,
      stock: filtrados,
      mensaje:
        items.length === 0
          ? "No hay registros de stock cargados en stock_minera todavía."
          : null,
    };
  },
});
