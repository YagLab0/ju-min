# Spec: Tools del agente — lectura del dominio de compras

**Status:** ready-for-agent

## Problem Statement

El agente eve del panel (la consulta con Assistant UI) no tiene acceso a datos: responde solo con lo que dicen sus instrucciones. Si la minera pregunta "¿qué insumos están bajo el punto de reorden?" o "¿quién me vende guantes más rápido?", el agente no puede contestar con el stock real, los proveedores verificados ni las ofertas, y por sus reglas tiene que decir que le falta información. Eso deja la consulta sin valor en el demo.

Además, en el repo quedó trabajo parcial de tools que leen Supabase directo con un cliente propio, salteando el módulo de dominio de compras: duplica lógica y usa un criterio de "proveedor verificado" distinto al del dominio.

## Solution

El agente tiene tres tools de solo lectura que obtienen los datos a través del módulo de dominio de compras, la única puerta de acceso a los datos. Con ellas puede responder consultas de stock, de proveedores verificados y de ofertas de un insumo, y justificar recomendaciones en texto con precio, lead time y trust score reales. Como pasa por el módulo de dominio, hereda el fallback al seed en memoria cuando Supabase no responde y el mismo criterio de red verificada que el resto de la app.

El agente no crea recomendaciones en la cola de pendientes del panel: recomienda en el texto de la consulta.

## User Stories

1. Como minera, quiero preguntarle al agente qué insumos están bajo el punto de reorden, para saber qué tengo que comprar.
2. Como minera, quiero que el agente me diga el stock actual, el punto de reorden y los días restantes de un insumo, para medir la urgencia.
3. Como minera, quiero preguntarle al agente qué proveedores verificados hay, para conocer la red.
4. Como minera, quiero filtrar los proveedores verificados por categoría, provincia o nombre desde la consulta, para acotar la búsqueda.
5. Como minera, quiero que los proveedores vengan ordenados por trust score, para ver primero los más confiables.
6. Como minera, quiero preguntar por un insumo con su nombre común ("guantes", "casco"), sin conocer identificadores, para consultar como hablo.
7. Como minera, quiero ver las ofertas de un insumo con precio, lead time, disponibilidad y proveedor verificado, para comparar alternativas.
8. Como minera, quiero que el agente me recomiende en texto una oferta justificada con precio, lead time y trust score reales, para decidir con datos.
9. Como minera, quiero que el agente me diga explícitamente cuando no hay datos (sin stock cargado, sin ofertas para un insumo), para no decidir sobre datos inventados.
10. Como presentador del demo, quiero que el agente responda con datos aunque Supabase no esté disponible (fallback al seed), para que el demo no dependa de la red.
11. Como jurado, quiero que los proveedores que menciona el agente sean los mismos que muestra el listado de proveedores verificados, para confiar en la coherencia del producto.
12. Como integrante del equipo, quiero que las tools pasen por el módulo de dominio, para no duplicar consultas ni criterios.
13. Como integrante del equipo, quiero tests determinísticos de cada tool sin LLM, para verificarlas sin depender de la cuota del modelo.
14. Como integrante del equipo, quiero que el módulo de dominio siga protegido contra importarse desde el browser, para no exponer credenciales.

## Implementation Decisions

- **Tres tools de solo lectura, una por archivo en el directorio de tools del agente eve** (el nombre de la tool sale del nombre del archivo):
  - **Consultar stock:** devuelve el stock de la minera por insumo: cantidad actual, punto de reorden, consumo mensual, estado (normal/alerta) y días restantes. Opcionalmente solo los insumos en alerta. Usa la lectura de stock del módulo de dominio.
  - **Listar proveedores verificados:** devuelve proveedores de la red verificada con trust score (valor y desglose), ubicación, provincias de operación, categorías y certificaciones relevantes. Filtros opcionales que ya soporta el módulo (categoría, provincia, texto, orden); por defecto ordenado por trust score descendente. Usa el listado de proveedores verificados del módulo.
  - **Listar ofertas de insumo:** recibe un insumo por texto parcial (nombre común) o por id; devuelve los insumos que coinciden y, para cada uno, sus ofertas con precio, moneda, lead time, disponibilidad y el proveedor verificado (nombre y trust score). Combina la lectura de insumos y de ofertas del módulo.
- **Acceso a datos solo por el módulo de dominio de compras.** Las tools no crean clientes de base de datos ni leen tablas. Se descarta el trabajo parcial previo (tools con cliente Supabase propio y su helper) y se reemplaza por estas tres tools. La tool que deshabilita la búsqueda web por defecto se conserva.
- **Prefactor: importar el módulo de dominio desde el runtime de eve.** El módulo se protege con el guard de solo-servidor, que lanza error fuera de un entorno de React Server; el runtime de eve no es ese entorno. Se resuelve con el arreglo menos invasivo: preferentemente configurar la condición de resolución en el bundler de eve si las docs instaladas lo soportan; si no, separar el guard en el punto de entrada que consume Next. Requisito: el módulo sigue sin poder importarse desde componentes cliente.
- **Salida de las tools:** JSON plano y compacto pensado para el modelo (sin campos irrelevantes como coordenadas o URLs de fuente), con montos y lead time explícitos. Resultados vacíos son válidos y se devuelven como lista vacía, nunca como error.
- **Solo lectura:** el agente no registra consultas ni recomendaciones en la base. No hay aprobación en el chat porque no hay escritura. La aprobación humana sigue siendo exclusivamente aprobar/rechazar en el panel.
- **Convivencia con el agente guionado:** el form de alertas del panel sigue usando el agente guionado (respaldo determinístico). Las tools solo afectan a la consulta con eve. No se unifican.
- **Instrucciones del agente:** se agrega que use sus tools para obtener stock, proveedores y ofertas, y que si una tool devuelve vacío lo diga en vez de suponer. Las reglas de dominio acotado y rechazo fijo no cambian.
- **Vocabulario:** nombres, descripciones de tools y copy con el glosario (Stock, Punto de reorden, Proveedor verificado, Oferta, Insumo, Trust score); evitar "inventario", "cotización", "mínimo".

## Testing Decisions

- **Qué es un buen test:** invoca la tool por su interfaz pública (su función de ejecución con una entrada válida) y verifica la salida observable, no detalles internos ni llamadas al módulo.
- **Costura única:** Vitest sobre cada tool, contra el módulo de dominio con la fuente en memoria (seed): determinístico, sin LLM, sin red. Los tests de las tools se incluyen en la configuración de Vitest existente.
- **Casos mínimos por tool:**
  - Stock: devuelve los insumos del seed con estado y días restantes; el filtro de alertas devuelve solo los que están bajo el punto de reorden.
  - Proveedores: solo red verificada, ordenados por trust score descendente; un filtro (provincia o texto) acota el resultado; un filtro sin coincidencias devuelve lista vacía.
  - Ofertas: un texto parcial ("guante") resuelve al insumo y devuelve sus ofertas con proveedor y trust score; un id también funciona; un insumo inexistente devuelve lista vacía.
- **Prior art:** los tests de Vitest del módulo de dominio de compras y del agente guionado.
- Sin E2E nuevo: la verificación en vivo contra el modelo depende de la cuota de Google y queda como prueba manual.

## Out of Scope

- Registrar consultas o recomendaciones desde el agente (cola de pendientes del panel).
- Aprobación de tools en el chat.
- Unificar el agente guionado con eve.
- Cambios en el módulo de dominio más allá del prefactor del guard de solo-servidor.
- Cambios en la UI del panel o de la consulta.
- Tests E2E contra el modelo.

## Further Notes

- eve está en beta: las docs de `node_modules/eve/docs/` tienen prioridad (definición de tools, deshabilitar tools, configuración del bundler).
- La key de Google tiene cuota de grounding 0: por eso se deshabilita la búsqueda web por defecto; no quitarla.
- El módulo de dominio cae al seed en memoria si Supabase no responde; en Supabase el stock de la minera puede estar vacío, en cuyo caso la tool de stock devuelve lista vacía y el agente lo informa.
- Modelo actual: `gemini-3.5-flash`.
