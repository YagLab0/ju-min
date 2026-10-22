// Adaptador en memoria: implementa FuenteDatosCompras sobre el seed mock.
// Es la fuente de datos por defecto (y la de los tests) hasta que llegue
// el adaptador del scraper o se configure Supabase.

import type {
  FilaConsulta,
  FilaRecomendacion,
  FuenteDatosCompras,
  NuevaConsulta,
  TablasCompras,
} from "./fuente-datos";
import { SEMILLA } from "./semilla";

export class FuenteDatosMemoria implements FuenteDatosCompras {
  private readonly tablas: TablasCompras = structuredClone(SEMILLA);

  async leerTablas(): Promise<TablasCompras> {
    return structuredClone(this.tablas);
  }

  async insertarConsulta(consulta: NuevaConsulta): Promise<FilaConsulta> {
    const fila: FilaConsulta = {
      id: crypto.randomUUID(),
      minera_id: consulta.mineraId,
      mensaje: consulta.mensaje,
      respuesta: consulta.respuesta,
      created_at: new Date().toISOString(),
    };
    this.tablas.consultas.push(fila);
    return structuredClone(fila);
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
    const filas: FilaRecomendacion[] = recomendaciones.map((r) => ({
      id: crypto.randomUUID(),
      consulta_id: consultaId,
      proveedor_id: r.proveedorId,
      insumo_id: r.insumoId,
      justificacion: r.justificacion,
      puntaje: r.puntaje,
      estado: "pendiente",
      created_at: new Date().toISOString(),
    }));
    this.tablas.recomendaciones.push(...filas);
    return structuredClone(filas);
  }

  async actualizarRecomendacion(
    id: string,
    cambios: { estado: FilaRecomendacion["estado"] },
  ): Promise<FilaRecomendacion | null> {
    const fila = this.tablas.recomendaciones.find((r) => r.id === id);
    if (!fila) return null;
    Object.assign(fila, cambios);
    return structuredClone(fila);
  }
}
