import { defineTool } from "eve/tools";
import { z } from "zod";
import {
  listarCategorias,
  listarProveedoresVerificados,
  type ProveedorVerificado,
} from "@/lib/compras/dominio";

function normalizarTexto(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim();
}

function ubicacion(p: ProveedorVerificado): string {
  return [p.localidad, p.provincia, p.pais].filter(Boolean).join(", ");
}

export default defineTool({
  description:
    "Lista los proveedores de la red verificada con su trust score (valor y " +
    "desglose), ubicación, provincias de operación, categorías y " +
    "certificaciones. Por defecto ordenados por trust score descendente. " +
    "Filtros opcionales por categoría, provincia y texto de nombre. Si " +
    "ningún proveedor coincide devuelve una lista vacía.",
  inputSchema: z.object({
    categoria: z
      .string()
      .optional()
      .describe(
        "Categoría de insumos que ofrece el proveedor, por nombre o slug " +
          "(ej. 'Venta de EPP', 'reactivos-quimicos').",
      ),
    provincia: z
      .string()
      .optional()
      .describe(
        "Provincia donde está ubicado u opera el proveedor (ej. 'Jujuy', " +
          "'Salta').",
      ),
    busqueda: z
      .string()
      .optional()
      .describe("Texto sobre la razón social o el nombre de fantasía."),
    orden: z
      .enum(["trust_score_desc", "trust_score_asc", "nombre_asc"])
      .optional()
      .describe(
        "Orden del listado: por trust score descendente (por defecto), " +
          "ascendente, o por nombre.",
      ),
  }),
  async execute({ categoria, provincia, busqueda, orden }) {
    let categoriaId: string | undefined;
    if (categoria) {
      const buscada = normalizarTexto(categoria);
      const encontrada = (await listarCategorias()).find(
        (c) =>
          normalizarTexto(c.nombre) === buscada ||
          normalizarTexto(c.slug) === buscada,
      );
      if (!encontrada) return { total: 0, proveedores: [] };
      categoriaId = encontrada.id;
    }

    let proveedores = await listarProveedoresVerificados({
      busqueda,
      categoriaId,
      orden,
    });

    if (provincia) {
      const buscada = normalizarTexto(provincia);
      proveedores = proveedores.filter(
        (p) =>
          (p.provincia !== null && normalizarTexto(p.provincia) === buscada) ||
          p.provinciasOperacion.some(
            (pr) => normalizarTexto(pr) === buscada,
          ),
      );
    }

    return {
      total: proveedores.length,
      proveedores: proveedores.map((p) => ({
        id: p.id,
        nombre: p.nombreFantasia ?? p.razonSocial,
        razon_social: p.razonSocial,
        estado: p.estado,
        trust_score: p.trustScore.valor,
        trust_score_desglose: p.trustScore.desglose,
        ubicacion: ubicacion(p),
        provincias_operacion: p.provinciasOperacion,
        categorias: p.categorias.map((c) => c.nombre),
        certificaciones: p.certificaciones.map((c) => ({
          nombre: c.certificacion.nombre,
          estado: c.estado,
        })),
      })),
    };
  },
});
