import { defineTool } from "eve/tools";
import { z } from "zod";
import { getSupabase, rows } from "../lib/supabase";

// Estados que significan "proveedor verificado" según el enum estado_proveedor
// y el seed: la red verificada es validado/auditado/homologado.
const ESTADOS_VERIFICADOS = ["validado", "auditado", "homologado"] as const;

interface ProveedorRow {
  id: string;
  razon_social: string;
  nombre_fantasia: string | null;
  cuit: string | null;
  localidad: string | null;
  provincia: string | null;
  estado: string;
  trust_score: number | string | null;
  sitio_web: string | null;
  provincias_operacion: string[] | null;
}

export default defineTool({
  description:
    "Lista proveedores verificados de la red (estado validado, auditado u homologado), " +
    "ordenados por trust score descendente. Filtros opcionales: insumo que ofrecen, " +
    "provincia donde operan, y texto sobre razón social o nombre de fantasía.",
  inputSchema: z.object({
    insumo: z
      .string()
      .optional()
      .describe(
        "Nombre (o parte) del insumo: solo proveedores con una oferta disponible de ese insumo.",
      ),
    provincia: z
      .string()
      .optional()
      .describe("Provincia donde opera el proveedor (ej. 'Jujuy', 'Salta')."),
    busqueda: z
      .string()
      .optional()
      .describe("Texto sobre razón social o nombre de fantasía."),
  }),
  async execute({ insumo, provincia, busqueda }) {
    const supabase = getSupabase();

    let idsConOferta: string[] | null = null;
    if (insumo) {
      const { data: insumos, error: errIns } = await supabase
        .from("insumos")
        .select("id")
        .ilike("nombre", `%${insumo}%`);
      if (errIns) throw new Error(`Error buscando insumos: ${errIns.message}`);
      const insumoIds = rows<{ id: string }>(insumos).map((i) => i.id);
      if (insumoIds.length === 0) {
        return {
          total: 0,
          proveedores: [],
          mensaje: `Ningún insumo del catálogo coincide con '${insumo}'.`,
        };
      }
      const { data: ofertas, error: errOf } = await supabase
        .from("ofertas_insumo")
        .select("proveedor_id")
        .in("insumo_id", insumoIds)
        .eq("disponible", true);
      if (errOf) throw new Error(`Error buscando ofertas: ${errOf.message}`);
      idsConOferta = [
        ...new Set(rows<{ proveedor_id: string }>(ofertas).map((o) => o.proveedor_id)),
      ];
      if (idsConOferta.length === 0) {
        return {
          total: 0,
          proveedores: [],
          mensaje: `Ningún proveedor verificado tiene oferta disponible de '${insumo}'.`,
        };
      }
    }

    let query = supabase
      .from("proveedores")
      .select(
        "id, razon_social, nombre_fantasia, cuit, localidad, provincia, " +
          "estado, trust_score, sitio_web, provincias_operacion",
      )
      .in("estado", [...ESTADOS_VERIFICADOS])
      .order("trust_score", { ascending: false, nullsFirst: false })
      .limit(50);

    if (idsConOferta) query = query.in("id", idsConOferta);
    if (provincia) {
      query = query.or(
        `provincia.ilike.%${provincia}%,provincias_operacion.cs.{${provincia}}`,
      );
    }
    if (busqueda) {
      query = query.or(
        `razon_social.ilike.%${busqueda}%,nombre_fantasia.ilike.%${busqueda}%`,
      );
    }

    const { data, error } = await query;
    if (error) throw new Error(`Error consultando proveedores: ${error.message}`);

    const proveedores = rows<ProveedorRow>(data).map((p) => ({
      id: p.id,
      razon_social: p.razon_social,
      nombre_fantasia: p.nombre_fantasia,
      cuit: p.cuit,
      localidad: p.localidad,
      provincia: p.provincia,
      provincias_operacion: p.provincias_operacion ?? [],
      estado: p.estado,
      trust_score: p.trust_score === null ? null : Number(p.trust_score),
      sitio_web: p.sitio_web,
    }));

    return {
      total: proveedores.length,
      proveedores,
      mensaje:
        proveedores.length === 0
          ? "No hay proveedores verificados que cumplan esos filtros."
          : null,
    };
  },
});
