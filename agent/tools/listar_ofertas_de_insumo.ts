import { defineTool } from "eve/tools";
import { z } from "zod";
import {
  listarInsumos,
  listarOfertasDeInsumo,
  listarProveedoresVerificados,
} from "@/lib/compras/dominio";

function normalizarTexto(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim();
}

export default defineTool({
  description:
    "Lista las ofertas de un insumo: precio, moneda, lead time en días, " +
    "disponibilidad y el proveedor verificado que la emite (nombre y trust " +
    "score). El insumo se indica por texto parcial de su nombre común " +
    "(ej. 'guante', 'casco') o por id. Si el insumo no existe o no tiene " +
    "ofertas devuelve una lista vacía.",
  inputSchema: z
    .object({
      insumo: z
        .string()
        .optional()
        .describe("Texto parcial del nombre común del insumo."),
      insumo_id: z
        .uuid()
        .optional()
        .describe("Id del insumo, si ya se conoce."),
    })
    .refine((v) => v.insumo !== undefined || v.insumo_id !== undefined, {
      message: "Indicá insumo (texto parcial) o insumo_id.",
    }),
  async execute({ insumo, insumo_id }) {
    const catalogo = await listarInsumos();
    const coinciden = insumo_id
      ? catalogo.filter((i) => i.id === insumo_id)
      : catalogo.filter((i) =>
          normalizarTexto(i.nombre).includes(normalizarTexto(insumo!)),
        );
    if (coinciden.length === 0) return { total: 0, insumos: [] };

    const verificados = new Map(
      (await listarProveedoresVerificados()).map((p) => [p.id, p]),
    );

    const insumos = [];
    for (const i of coinciden) {
      const ofertas = (await listarOfertasDeInsumo(i.id))
        .flatMap((o) => {
          const proveedor = verificados.get(o.proveedorId);
          if (!proveedor) return [];
          return [
            {
              proveedor_id: proveedor.id,
              proveedor: proveedor.nombreFantasia ?? proveedor.razonSocial,
              trust_score: proveedor.trustScore.valor,
              precio: o.precio,
              moneda: o.moneda,
              lead_time_dias: o.leadTimeDias,
              disponible: o.disponible,
            },
          ];
        })
        .sort(
          (a, b) =>
            Number(b.disponible) - Number(a.disponible) ||
            (a.lead_time_dias ?? Infinity) - (b.lead_time_dias ?? Infinity) ||
            a.precio - b.precio,
        );
      insumos.push({
        insumo_id: i.id,
        insumo: i.nombre,
        unidad: i.unidad,
        especificacion: i.especificacion,
        ofertas,
      });
    }

    return { total: insumos.length, insumos };
  },
});
