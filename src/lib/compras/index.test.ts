// Tests del módulo de dominio de compras por su interfaz pública (costura 1
// de la spec). Corren contra el seed mock; cuando llegue el adaptador del
// scraper deben seguir pasando sin tocarlos — validan el contrato.

import { describe, expect, it } from "vitest";

import {
  generarInforme,
  listarCategorias,
  listarHistorialConsultas,
  listarInsumos,
  listarOfertasDeInsumo,
  listarProveedoresVerificados,
  listarRecomendaciones,
  listarStockMinera,
  obtenerMinera,
  obtenerProveedorVerificado,
  registrarConsulta,
  verificarInforme,
} from "./index";

const ID_EPP = "ca000000-0000-4000-8000-000000000001";
const ID_FILTROS = "ca000000-0000-4000-8000-000000000008";
const ID_GUANTE = "10000000-0000-4000-8000-000000000001";
const ID_OFERTA_GUANTE_ANDINA = "0f000000-0000-4000-8000-000000000001";
const ID_ANDINA = "f0000000-0000-4000-8000-000000000001";
const ID_REGISTRADO = "f0000000-0000-4000-8000-000000000017";
const AUTOR = { id: "u-1", nombre: "Julián Paredes", email: "julian@minera.test" };

describe("listarProveedoresVerificados", () => {
  it("lista solo la red verificada: proveedores validados y homologados", async () => {
    const proveedores = await listarProveedoresVerificados();

    expect(proveedores).toHaveLength(16);
    for (const p of proveedores) {
      expect(["validado", "homologado"]).toContain(p.estado);
    }
    const nombres = proveedores.map((p) => p.razonSocial);
    // registrado, documentado, auditado y suspendido no integran la red
    expect(nombres).not.toContain("Neumáticos Cerro Rico S.A.");
    expect(nombres).not.toContain("Mantenimiento Industrial Ledesma S.R.L.");
    expect(nombres).not.toContain("Válvulas y Caños Tumbaya S.R.L.");
    expect(nombres).not.toContain("Combustibles del Valle S.A.");
  });

  it("incluye trust score, ubicación y certificaciones en cada tarjeta", async () => {
    const proveedores = await listarProveedoresVerificados();
    const andina = proveedores.find(
      (p) => p.razonSocial === "Andina de Seguridad Industrial S.R.L.",
    );
    expect(andina).toBeDefined();
    expect(andina!.trustScore.valor).toBe(91);
    expect(andina!.localidad).toBe("San Salvador de Jujuy");
    expect(andina!.provincia).toBe("Jujuy");
    expect(andina!.fuente).toBe("capmin");
    expect(andina!.certificaciones.length).toBeGreaterThan(0);
    // el desglose del trust score suma el valor total
    const d = andina!.trustScore.desglose;
    expect(d.identidad + d.compliance + d.esg + d.capacidad).toBe(
      andina!.trustScore.valor,
    );
  });

  it("ordena por trust score descendente por defecto", async () => {
    const proveedores = await listarProveedoresVerificados();
    expect(proveedores[0].razonSocial).toBe(
      "Reactivos y Químicos San Salvador S.A.",
    );
    expect(proveedores[0].trustScore.valor).toBe(95);
    expect(proveedores[1].trustScore.valor).toBe(91);
    expect(proveedores.at(-1)!.trustScore.valor).toBe(70);
  });

  it("ordena por trust score ascendente cuando se pide", async () => {
    const proveedores = await listarProveedoresVerificados({
      orden: "trust_score_asc",
    });
    expect(proveedores[0].trustScore.valor).toBe(70);
    expect(proveedores.at(-1)!.trustScore.valor).toBe(95);
  });

  it("ordena por nombre cuando se pide", async () => {
    const proveedores = await listarProveedoresVerificados({
      orden: "nombre_asc",
    });
    expect(proveedores[0].razonSocial).toBe(
      "Aceros y Molienda del Norte S.A.",
    );
  });

  it("filtra por categoría de insumo", async () => {
    const proveedores = await listarProveedoresVerificados({
      categoriaId: ID_FILTROS,
    });
    expect(proveedores.map((p) => p.razonSocial).sort()).toEqual([
      "Filtros y Filtrados Puna S.R.L.",
      "Repuestos Pesados Calilegua S.R.L.",
    ]);
  });

  it("filtra por insumo: solo proveedores que lo ofertan", async () => {
    const proveedores = await listarProveedoresVerificados({
      insumoId: ID_GUANTE,
    });
    expect(proveedores.map((p) => p.razonSocial).sort()).toEqual([
      "Andina de Seguridad Industrial S.R.L.",
      "Repuestos Pesados Calilegua S.R.L.",
    ]);
  });

  it("busca por nombre de fantasía y razón social, sin distinguir acentos", async () => {
    const porPuna = await listarProveedoresVerificados({ busqueda: "puna" });
    expect(porPuna).toHaveLength(3);

    const porQuimicos = await listarProveedoresVerificados({
      busqueda: "quimicos",
    });
    expect(porQuimicos.map((p) => p.razonSocial)).toEqual([
      "Reactivos y Químicos San Salvador S.A.",
    ]);
  });

  it("combina búsqueda y filtro de categoría", async () => {
    const proveedores = await listarProveedoresVerificados({
      categoriaId: ID_FILTROS,
      busqueda: "calilegua",
    });
    expect(proveedores.map((p) => p.razonSocial)).toEqual([
      "Repuestos Pesados Calilegua S.R.L.",
    ]);
  });

  it("devuelve lista vacía cuando nada coincide", async () => {
    const proveedores = await listarProveedoresVerificados({
      busqueda: "nombre que no existe",
    });
    expect(proveedores).toEqual([]);
  });
});

describe("obtenerProveedorVerificado", () => {
  it("devuelve la ficha con ofertas y desglose del trust score", async () => {
    const proveedor = await obtenerProveedorVerificado(ID_ANDINA);
    expect(proveedor).not.toBeNull();
    expect(proveedor!.razonSocial).toBe(
      "Andina de Seguridad Industrial S.R.L.",
    );
    expect(proveedor!.ofertas.length).toBe(4);
    const d = proveedor!.trustScore.desglose;
    expect(d.identidad + d.compliance + d.esg + d.capacidad).toBe(
      91,
    );
  });

  it("cada oferta de la ficha trae el insumo con precio, unidad, lead time y disponibilidad", async () => {
    const proveedor = await obtenerProveedorVerificado(ID_ANDINA);
    const guante = proveedor!.ofertas.find(
      (o) => o.insumo.nombre === "Guante de nitrilo industrial",
    );
    expect(guante).toBeDefined();
    expect(guante!.precio).toBe(3800);
    expect(guante!.moneda).toBe("ARS");
    expect(guante!.insumo.unidad).toBe("par");
    expect(guante!.insumo.especificacion).toBe(
      "Nitrilo 0,38 mm, puño largo",
    );
    expect(guante!.leadTimeDias).toBe(7);
    expect(guante!.disponible).toBe(true);
  });

  it("la ficha expone certificaciones con estado y vencimiento, y la fuente de verificación", async () => {
    const proveedor = await obtenerProveedorVerificado(ID_ANDINA);
    expect(proveedor!.fuente).toBe("capmin");
    expect(proveedor!.registroJujuyEstado).toBe("aprobado");
    const iso = proveedor!.certificaciones.find(
      (c) => c.certificacion.codigo === "ISO 9001",
    );
    expect(iso).toBeDefined();
    expect(iso!.estado).toBe("verificado");
    expect(iso!.fechaVencimiento).toBe("2027-02-09");
    expect(iso!.organismo).toBe("IRAM");
  });

  it("devuelve null para una ficha inexistente", async () => {
    const proveedor = await obtenerProveedorVerificado(
      "99999999-9999-4999-8999-999999999999",
    );
    expect(proveedor).toBeNull();
  });

  it("devuelve null para un proveedor fuera de la red verificada", async () => {
    const proveedor = await obtenerProveedorVerificado(ID_REGISTRADO);
    expect(proveedor).toBeNull();
  });
});

describe("listarOfertasDeInsumo", () => {
  it("lista las ofertas del insumo con precio y lead time", async () => {
    const ofertas = await listarOfertasDeInsumo(ID_GUANTE);
    expect(ofertas).toHaveLength(2);
    const precios = ofertas.map((o) => o.precio).sort((a, b) => a - b);
    expect(precios).toEqual([3800, 4100]);
  });
});

describe("obtenerMinera", () => {
  it("devuelve la minera del demo", async () => {
    const minera = await obtenerMinera();
    expect(minera.nombre).toBe("Sales de Jujuy S.A.");
    expect(minera.ubicacion).toBe("Salar de Olaroz, Jujuy");
  });
});

describe("listarStockMinera", () => {
  it("ordena para reponer primero: alertas antes, por días restantes", async () => {
    const stock = await listarStockMinera();
    expect(stock[0].estado).toBe("alerta");
    expect(stock[0].insumo.nombre).toBe("Guante de nitrilo industrial");
    const dias = stock
      .filter((s) => s.estado === "normal")
      .map((s) => s.diasRestantes ?? Infinity);
    expect(dias).toEqual([...dias].sort((a, b) => a - b));
  });

  it("marca en alerta el insumo por debajo del punto de reorden", async () => {
    const stock = await listarStockMinera();
    const guante = stock.find(
      (s) => s.insumo.nombre === "Guante de nitrilo industrial",
    );
    expect(guante).toBeDefined();
    expect(guante!.estado).toBe("alerta");
    expect(guante!.cantidadActual).toBe(120);
    expect(guante!.puntoReorden).toBe(300);
  });

  it("en el borde exacto del punto de reorden no hay alerta", async () => {
    const stock = await listarStockMinera();
    const respirador = stock.find(
      (s) => s.insumo.nombre === "Respirador con filtro N95",
    );
    expect(respirador).toBeDefined();
    expect(respirador!.cantidadActual).toBe(respirador!.puntoReorden);
    expect(respirador!.estado).toBe("normal");
  });

  it("calcula los días de stock según el consumo mensual", async () => {
    const stock = await listarStockMinera();
    const guante = stock.find(
      (s) => s.insumo.nombre === "Guante de nitrilo industrial",
    );
    // 120 unidades a 600 por mes ≈ 6 días
    expect(guante!.diasRestantes).toBe(6);
    const aceite = stock.find(
      (s) => s.insumo.nombre === "Aceite lubricante 15W-40",
    );
    // 2400 litros a 900 por mes ≈ 80 días
    expect(aceite!.diasRestantes).toBe(80);
  });
});

describe("consultas y recomendaciones", () => {
  it("registra una consulta con recomendaciones pendientes", async () => {
    const consulta = await registrarConsulta({
      mensaje: "¿Quién vende guantes de nitrilo?",
      recomendaciones: [
        {
          ofertaId: ID_OFERTA_GUANTE_ANDINA,
          justificacion: "Menor lead time: 7 días.",
          puntaje: 91,
        },
      ],
    });
    expect(consulta.mensaje).toBe("¿Quién vende guantes de nitrilo?");
    expect(consulta.recomendaciones).toHaveLength(1);
    const rec = consulta.recomendaciones[0];
    expect(rec.estado).toBe("pendiente");
    expect(rec.ofertaId).toBe(ID_OFERTA_GUANTE_ANDINA);
    expect(rec.proveedorId).toBe(ID_ANDINA);
    expect(rec.insumoId).toBe(ID_GUANTE);
  });

  it("rechaza una consulta sin mensaje y una oferta inexistente", async () => {
    await expect(registrarConsulta({ mensaje: "  " })).rejects.toThrow();
    await expect(
      registrarConsulta({
        mensaje: "consulta válida",
        recomendaciones: [
          { ofertaId: "oferta-que-no-existe", justificacion: "x", puntaje: null },
        ],
      }),
    ).rejects.toThrow();
  });

  it("lista las recomendaciones detalladas, más nueva primero", async () => {
    const consulta = await registrarConsulta({
      mensaje: "Reponer guantes de nitrilo",
      recomendaciones: [
        {
          ofertaId: ID_OFERTA_GUANTE_ANDINA,
          justificacion: "Menor lead time: 7 días.",
          puntaje: 91,
        },
      ],
    });
    const rec = consulta.recomendaciones[0];

    const lista = await listarRecomendaciones();
    expect(lista[0].id).toBe(rec.id);
    // viene con insumo, oferta y proveedor resueltos para el panel
    expect(lista[0].insumo?.id).toBe(ID_GUANTE);
    expect(lista[0].oferta?.id).toBe(ID_OFERTA_GUANTE_ANDINA);
    expect(lista[0].proveedor?.id).toBe(ID_ANDINA);
    expect(lista[0].informeCodigo).toBeNull();
  });
  it("lee el historial de consultas con sus recomendaciones", async () => {
    const historial = await listarHistorialConsultas();
    const semilla = historial.find(
      (c) => c.id === "c0000000-0000-4000-8000-000000000002",
    );
    expect(semilla).toBeDefined();
    expect(semilla!.recomendaciones).toHaveLength(2);
    expect(
      semilla!.recomendaciones.map((r) => r.estado).sort(),
    ).toEqual(["aprobada", "rechazada"]);
    // cada recomendación del historial viene detallada para enlazar la ficha
    expect(
      semilla!.recomendaciones.every(
        (r) => Boolean(r.proveedor?.id) && Boolean(r.insumo?.id),
      ),
    ).toBe(true);
    // orden descendente por fecha
    expect(historial[0].creadaEn >= historial.at(-1)!.creadaEn).toBe(true);
  });
});

describe("catálogo para los filtros del explorer", () => {
  it("lista categorías e insumos ordenados por nombre", async () => {
    const categorias = await listarCategorias();
    const insumos = await listarInsumos();
    expect(categorias.some((c) => c.id === ID_EPP)).toBe(true);
    expect(categorias.some((c) => c.id === ID_FILTROS)).toBe(true);
    expect(insumos.some((i) => i.id === ID_GUANTE)).toBe(true);
    expect(insumos.length).toBeGreaterThanOrEqual(15);
  });
});

describe("informes de recomendación", () => {
  async function nuevaRecomendacion() {
    const consulta = await registrarConsulta({
      mensaje: "Reponer filtros de aceite",
      recomendaciones: [
        {
          ofertaId: "0f000000-0000-4000-8000-000000000015",
          justificacion: "Menor precio y menor lead time.",
          puntaje: 78,
        },
      ],
    });
    return consulta.recomendaciones[0];
  }

  it("genera un informe con código, autor y una copia de la recomendación", async () => {
    const rec = await nuevaRecomendacion();
    const informe = await generarInforme(rec.id, AUTOR);

    expect(informe.codigo).toMatch(/^JM-[0-9A-HJKMNP-TV-Z]{4}-[0-9A-HJKMNP-TV-Z]{4}-[0-9A-HJKMNP-TV-Z]{4}$/);
    expect(informe.recomendacionId).toBe(rec.id);
    expect(informe.generadoPor).toEqual(AUTOR);
    expect(informe.sello).toMatch(/^[0-9a-f]{64}$/);
    expect(informe.contenido.insumo.nombre).toBe(
      "Filtro de aceite para motor diésel",
    );
    expect(informe.contenido.justificacion).toBe("Menor precio y menor lead time.");
    // la elegida no se repite entre alternativas ni descartadas
    const otros = [
      ...informe.contenido.alternativas.map((a) => a.proveedor),
      ...informe.contenido.descartados.map((d) => d.proveedor),
    ];
    expect(otros).not.toContain(informe.contenido.proveedor.razonSocial);
    // la otra oferta del insumo figura, como alternativa o descartada
    expect(otros).toContain("Repuestos Pesados Calilegua S.R.L.");
    for (const d of informe.contenido.descartados) expect(d.motivo).not.toBe("");
  });

  it("una recomendación tiene un solo informe", async () => {
    const rec = await nuevaRecomendacion();
    const primero = await generarInforme(rec.id, AUTOR);
    const segundo = await generarInforme(rec.id, {
      id: "u-2",
      nombre: "Otra persona",
      email: "otra@minera.test",
    });
    expect(segundo.codigo).toBe(primero.codigo);
    expect(segundo.generadoPor).toEqual(AUTOR);

    const lista = await listarRecomendaciones();
    expect(lista.find((r) => r.id === rec.id)?.informeCodigo).toBe(
      primero.codigo,
    );
  });

  it("verifica un informe por su código, sin importar mayúsculas ni espacios", async () => {
    const rec = await nuevaRecomendacion();
    const informe = await generarInforme(rec.id, AUTOR);

    const resultado = await verificarInforme(`  ${informe.codigo.toLowerCase()} `);
    expect(resultado?.integro).toBe(true);
    expect(resultado?.informe.sello).toBe(informe.sello);

    expect(await verificarInforme("JM-0000-0000-0000")).toBeNull();
    expect(await verificarInforme("   ")).toBeNull();
  });

  it("no genera informes de recomendaciones inexistentes", async () => {
    await expect(
      generarInforme("99999999-9999-4999-8999-999999999999", AUTOR),
    ).rejects.toThrow();
  });
});
