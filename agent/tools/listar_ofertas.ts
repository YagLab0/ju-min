import { defineTool } from "eve/tools";
import { z } from "zod";
import { getSupabase, rel, rows } from "../lib/supabase";

interface OfertaRow {
  id: string;
  precio: number | string;
  moneda: string;
  lead_time_dias: number | null;
  disponible: boolean;
  vigente_desde: string | null;
  vigente_hasta: string | null;
  insumos: unknown;
  proveedores: unknown;
}

export default defineTool({
  description:
    "Lista las ofertas de insumos de proveedores verificados: precio, moneda, unidad, " +
    "lead time en días, disponibilidad y vigencia, con el nombre del proveedor y su " +
    "trust score. Requiere al menos un filtro: insumo_id o proveedor_id.",
  inputSchema: z
    .object({
      insumo_id: z
        .uuid()
        .optional()
        .describe("Ofertas de este insumo (conseguirlo con listar_insumos)."),
      proveedor_id: z
        .uuid()
        .optional()
        .describe("Ofertas de este proveedor (conseguirlo con listar_proveedores)."),
      solo_disponibles: z
        .boolean()
        .optional()
        .describe("Si es true, excluye ofertas sin disponibilidad."),
    })
    .refine((v) => v.insumo_id !== undefined || v.proveedor_id !== undefined, {
      message: "Indicá insumo_id o proveedor_id.",
    }),
  async execute({ insumo_id, proveedor_id, solo_disponibles }) {
    const supabase = getSupabase();
    let query = supabase
      .from("ofertas_insumo")
      .select(
        "id, precio, moneda, lead_time_dias, disponible, vigente_desde, vigente_hasta, " +
          "insumos(id, nombre, unidad), " +
          "proveedores(id, razon_social, nombre_fantasia, estado, trust_score)",
      )
      .order("precio", { ascending: true })
      .limit(100);
    if (insumo_id) query = query.eq("insumo_id", insumo_id);
    if (proveedor_id) query = query.eq("proveedor_id", proveedor_id);
    if (solo_disponibles) query = query.eq("disponible", true);

    const { data, error } = await query;
    if (error) throw new Error(`Error consultando ofertas: ${error.message}`);

    const ofertas = rows<OfertaRow>(data).map((o) => {
      const ins = rel<{ id: string; nombre: string; unidad: string }>(o.insumos);
      const prov = rel<{
        id: string;
        razon_social: string;
        nombre_fantasia: string | null;
        estado: string;
        trust_score: number | string | null;
      }>(o.proveedores);
      return {
        id: o.id,
        insumo_id: ins?.id ?? null,
        insumo: ins?.nombre ?? null,
        unidad: ins?.unidad ?? null,
        proveedor_id: prov?.id ?? null,
        proveedor: prov?.nombre_fantasia ?? prov?.razon_social ?? null,
        proveedor_estado: prov?.estado ?? null,
        trust_score:
          prov?.trust_score === null || prov?.trust_score === undefined
            ? null
            : Number(prov.trust_score),
        precio: Number(o.precio),
        moneda: o.moneda,
        lead_time_dias: o.lead_time_dias,
        disponible: o.disponible,
        vigente_desde: o.vigente_desde,
        vigente_hasta: o.vigente_hasta,
      };
    });

    return {
      total: ofertas.length,
      ofertas,
      mensaje:
        ofertas.length === 0 ? "No hay ofertas que cumplan esos filtros." : null,
    };
  },
});
