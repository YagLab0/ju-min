import { defineTool } from "eve/tools";
import { z } from "zod";
import { listarStockMinera } from "@/lib/compras/dominio";

export default defineTool({
  description:
    "Devuelve el stock de insumos de la minera: cantidad actual, punto de " +
    "reorden, consumo mensual, estado (normal o alerta, cuando está por " +
    "debajo del punto de reorden) y días restantes según el consumo. " +
    "Ordenado para reponer primero: alertas antes. Si no hay stock cargado " +
    "devuelve una lista vacía.",
  inputSchema: z.object({
    solo_en_alerta: z
      .boolean()
      .optional()
      .describe(
        "Si es true, devuelve solo los insumos en alerta (por debajo del " +
          "punto de reorden).",
      ),
  }),
  async execute({ solo_en_alerta }) {
    const stock = (await listarStockMinera()).map((s) => ({
      insumo_id: s.insumo.id,
      insumo: s.insumo.nombre,
      unidad: s.insumo.unidad,
      cantidad_actual: s.cantidadActual,
      punto_reorden: s.puntoReorden,
      consumo_mensual: s.consumoMensual,
      estado: s.estado,
      dias_restantes: s.diasRestantes,
    }));
    const filtrados = solo_en_alerta
      ? stock.filter((s) => s.estado === "alerta")
      : stock;
    return {
      total: filtrados.length,
      en_alerta: stock.filter((s) => s.estado === "alerta").length,
      stock: filtrados,
    };
  },
});
