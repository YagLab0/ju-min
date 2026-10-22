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
| Identidad | CUIT validado, antigüedad fiscal, registro provincial aprobado | 20% |
| Compliance | ISOs vigentes (9001/14001/45001), certificaciones de producto requeridas cumplidas, habilitaciones sectoriales | 30% |
| Desempeño | OTIF historial, penalidades, rating directorio | 30% |
| ESG | Huella de carbono reportada, políticas, screening limpio | 10% |
| Capacidad | Lead time vs. categoría, cobertura geográfica, respuesta a consultas | 10% |

### 3.3 Requisitos por categoría de insumo

La regla de negocio central para que el agente "justifique" recomendaciones:

> Un proveedor solo puede recomendarse para un insumo si cumple los requisitos
> (certificaciones + habilitaciones) de la categoría de ese insumo.

Ej.: `Explosivos` requiere `habilitación ANMaC/RENAR` + `ISO 9001` +
`transporte mercancías peligrosas`. `Venta de EPP` requiere `IRAM/EN` por
producto + `ISO 9001` de empresa. `Geomembranas` requiere `GRI-GM13`.

---

