// El PDF del informe se arma con pdf-lib: se valida que salga un PDF y que
// el texto con caracteres fuera de WinAnsi (flechas, ≥) no lo rompa.

import { PDFDocument } from "pdf-lib";
import { describe, expect, it } from "vitest";

import type { Informe } from "@/lib/compras";

import { renderizarInformePdf } from "./pdf";

const INFORME: Informe = {
  id: "i-1",
  codigo: "JM-7K3Q-9XWD-2M4P",
  mineraId: "m-1",
  recomendacionId: "r-1",
  generadoPor: { id: "u-1", nombre: "Julián Paredes", email: "julian@minera.test" },
  creadoEn: "2026-10-29T11:00:00.000Z",
  sello: "a".repeat(64),
  contenido: {
    minera: "Sales de Jujuy S.A.",
    insumo: { nombre: 'Bola de acero forjado para molienda 3"', unidad: "kg", especificacion: "Dureza 60-65 HRC" },
    stock: { cantidadActual: 8000, puntoReorden: 12000, diasRestantes: 16 },
    proveedor: { razonSocial: "Aceros y Molienda del Norte S.A.", cuit: "30-69991122-4", trustScore: 85 },
    oferta: { precio: 1850.5, moneda: "ARS", leadTimeDias: 10 },
    justificacion: "Mejor plazo → llega antes del faltante; trust score ≥ 80.",
    requisitos: ["EN 10204 3.1"],
    alternativas: [
      { proveedor: "Otro S.A.", precio: 1700, moneda: "ARS", leadTimeDias: 25, trustScore: 78 },
    ],
    descartados: [{ proveedor: "Tercero S.R.L.", motivo: "Le faltan requisitos obligatorios: EN 10204 3.1" }],
  },
};

describe("renderizarInformePdf", () => {
  it("genera un PDF con los metadatos del informe", async () => {
    const bytes = await renderizarInformePdf(INFORME, "https://ju-min.test/verificar");
    expect(new TextDecoder().decode(bytes.slice(0, 5))).toBe("%PDF-");

    const doc = await PDFDocument.load(bytes);
    expect(doc.getPageCount()).toBeGreaterThanOrEqual(1);
    expect(doc.getTitle()).toBe("Informe de recomendación JM-7K3Q-9XWD-2M4P");
  });
});
