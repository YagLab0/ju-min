// Adaptador Supabase: implementa FuenteDatosCompras contra las tablas de
// supabase/migrations. Solo se activa cuando existen NEXT_PUBLIC_SUPABASE_URL
// y SUPABASE_SERVICE_ROLE_KEY (ver .env.example); si no, el módulo usa el
// adaptador en memoria. Corre solo en el servidor (service role).

import { createClient, type SupabaseClient } from "@supabase/supabase-js";

import type {
  FilaAuditoria,
  FilaCategoria,
  FilaCertificacion,
  FilaConsulta,
  FilaContactoProveedor,
  FilaDocumento,
  FilaEntrega,
  FilaInsumo,
  FilaMinera,
  FilaOferta,
  FilaProveedor,
  FilaProveedorCategoria,
  FilaProveedorCertificacion,
  FilaRecomendacion,
  FilaRequisitoCategoria,
  FilaStockMinera,
  FilaTrustScoreHistorial,
  FuenteDatosCompras,
  NuevaConsulta,
  TablasCompras,
} from "./fuente-datos";

export class AdaptadorSupabase implements FuenteDatosCompras {
  private readonly db: SupabaseClient;

  constructor(url: string, serviceRoleKey: string) {
    this.db = createClient(url, serviceRoleKey, {
      auth: { persistSession: false, autoRefreshToken: false },
    });
  }

  async leerTablas(): Promise<TablasCompras> {
    const [
      categorias,
      certificaciones,
      requisitosCategoria,
      proveedores,
      contactosProveedor,
      proveedorCategorias,
      documentos,
      proveedorCertificaciones,
      auditorias,
      insumos,
      ofertas,
      mineras,
      stockMinera,
      consultas,
      recomendaciones,
      entregas,
      trustScoreHistorial,
    ] = await Promise.all([
      this.todo<FilaCategoria>("categorias"),
      this.todo<FilaCertificacion>("certificaciones"),
      this.todo<FilaRequisitoCategoria>("requisitos_categoria"),
      this.todo<FilaProveedor>("proveedores"),
      this.todo<FilaContactoProveedor>("contactos_proveedor"),
      this.todo<FilaProveedorCategoria>("proveedor_categorias"),
      this.todo<FilaDocumento>("documentos"),
      this.todo<FilaProveedorCertificacion>("proveedor_certificaciones"),
      this.todo<FilaAuditoria>("auditorias"),
      this.todo<FilaInsumo>("insumos"),
      this.todo<FilaOferta>("ofertas_insumo"),
      this.todo<FilaMinera>("mineras"),
      this.todo<FilaStockMinera>("stock_minera"),
      this.todo<FilaConsulta>("consultas"),
      this.todo<FilaRecomendacion>("recomendaciones"),
      this.todo<FilaEntrega>("entregas"),
      this.todo<FilaTrustScoreHistorial>("trust_score_historial"),
    ]);
    const minera = mineras[0];
    if (!minera) throw new Error("minera_no_encontrada");
    return {
      categorias,
      certificaciones,
      requisitosCategoria,
      proveedores,
      contactosProveedor,
      proveedorCategorias,
      documentos,
      proveedorCertificaciones,
      auditorias,
      insumos,
      ofertas,
      minera,
      stockMinera,
      consultas,
      recomendaciones,
      entregas,
      trustScoreHistorial,
    };
  }

  async insertarConsulta(consulta: NuevaConsulta): Promise<FilaConsulta> {
    return this.insertar<FilaConsulta>("consultas", {
      minera_id: consulta.mineraId,
      mensaje: consulta.mensaje,
      respuesta: consulta.respuesta,
      estado: "pendiente",
    });
  }

  async insertarRecomendaciones(
    consultaId: string,
    recomendaciones: {
      proveedorId: string | null;
      insumoId: string | null;
      justificacion: string;
      puntaje: number | null;
    }[],
  ): Promise<FilaRecomendacion[]> {
    const filas = recomendaciones.map((r) => ({
      consulta_id: consultaId,
      proveedor_id: r.proveedorId,
      insumo_id: r.insumoId,
      justificacion: r.justificacion,
      puntaje: r.puntaje,
      estado: "pendiente",
    }));
    const { data, error } = await this.db
      .from("recomendaciones")
      .insert(filas)
      .select();
    if (error) throw new Error(`supabase: ${error.message}`);
    return data as FilaRecomendacion[];
  }

  async actualizarRecomendacion(
    id: string,
    cambios: { estado: FilaRecomendacion["estado"] },
  ): Promise<FilaRecomendacion | null> {
    const { data, error } = await this.db
      .from("recomendaciones")
      .update({ estado: cambios.estado })
      .eq("id", id)
      .select()
      .maybeSingle();
    if (error) throw new Error(`supabase: ${error.message}`);
    return data as FilaRecomendacion | null;
  }

  private async todo<T>(tabla: string): Promise<T[]> {
    const { data, error } = await this.db.from(tabla).select("*");
    if (error) throw new Error(`supabase ${tabla}: ${error.message}`);
    return data as T[];
  }

  private async insertar<T>(tabla: string, fila: object): Promise<T> {
    const { data, error } = await this.db
      .from(tabla)
      .insert(fila)
      .select()
      .single();
    if (error) throw new Error(`supabase ${tabla}: ${error.message}`);
    return data as T;
  }
}
