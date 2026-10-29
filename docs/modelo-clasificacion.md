# Modelo de clasificación de proveedores

Parte de la documentación de ju-min — índice en [DOCS.md](DOCS.md).


### 3.1 Pipeline de verificación del proveedor

```
registrado → documentado → validado → auditado → homologado
```

| Estado | Significado | Trigger |
|---|---|---|
| `registrado` | Existe en una fuente (CAPMIN, registro Jujuy) | Ingesta automática |
| `documentado` | Cargó identidad fiscal + documentos | CUIT válido, docs subidos |
| `validado` | Documentos verificados contra fuente externa | Check de CUIT/AFIP, registro provincial aprobado |
| `auditado` | Pasó auditoría presencial o remota | Informe de auditoría cargado |
| `homologado` | Apto para recibir propuestas de compra | Todos los requisitos de sus categorías cumplidos |

### 3.2 Trust score — inputs

El README define el trust score como señal calculada. Inputs propuestos,
ponderados:

| Grupo | Señales | Peso sugerido |
|---|---|---|
| Identidad | CUIT validado, antigüedad fiscal, registro provincial aprobado | 25% |
| Compliance | ISOs vigentes (9001/14001/45001), certificaciones de producto requeridas cumplidas, habilitaciones sectoriales | 45% |
| ESG | Huella de carbono reportada, políticas, screening limpio | 15% |
| Capacidad | Estado de verificación, cobertura geográfica, respuesta a consultas | 15% |

Sin desempeño (OTIF, penalidades): ju-min es consultor y la recepción ocurre
en el sistema de la minera, así que no ve las entregas
([negocio/business-model-canvas.md](negocio/business-model-canvas.md)). Vuelve
si hay datos reales (pregunta opcional al pedir un nuevo informe o export del
ERP).

### 3.3 Requisitos por categoría de insumo

La regla de negocio central para que el agente "justifique" recomendaciones:

> Un proveedor solo puede recomendarse para un insumo si cumple los requisitos
> (certificaciones + habilitaciones) de la categoría de ese insumo.

Ej.: `Explosivos` requiere `habilitación ANMaC/RENAR` + `ISO 9001` +
`transporte mercancías peligrosas`. `Venta de EPP` requiere `IRAM/EN` por
producto + `ISO 9001` de empresa. `Geomembranas` requiere `GRI-GM13`.

---

