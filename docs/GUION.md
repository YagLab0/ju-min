# Guion del pitch — Jumin (2:30 min)

Versión corta del [pitch extendido](pitch.md), armada sobre el
[deck de 8 láminas](../public/slide-deck.html) más una demo en vivo de 50 s.
Las frases entre comillas se dicen; lo demás es acción en pantalla.

| Tramo | Tiempo | Pantalla | Idea |
|---|---|---|---|
| 1. Gancho | 0:00–0:10 | Lámina 1 | La planta parada cuesta más que el insumo |
| 2. Problema | 0:10–0:35 | Láminas 2 y 3 | Evidencia en PDFs, recompra de memoria, riesgo en altura |
| 3. Solución | 0:35–1:00 | Lámina 4 | Red verificada + alertas + agente, con regla dura |
| 4. Demo | 1:00–1:50 | App en vivo | Alerta → recomendación → comparación → aprobación |
| 5. Respaldo | 1:50–2:05 | Lámina 6 | Datos reales, cero inventados |
| 6. Cierre | 2:05–2:30 | Lámina 8 | Modelo, roadmap y frase final |

La lámina 7 (arquitectura) se pasa sin hablar: queda para las preguntas.

---

## 1. Gancho — 0:00 a 0:10 (lámina 1)

> «Imaginen que la planta deja de moler porque se acabaron las bolas de acero.
> El insumo cuesta centavos el kilo. La planta parada cuesta miles por hora.»

## 2. Problema — 0:10 a 0:35 (láminas 2 y 3)

> «Hoy, quien compra en una minera valida cada proveedor a mano. Las
> certificaciones ISO, ESG y las habilitaciones viven en PDFs y correos, y
> nadie sabe si siguen vigentes.»

*Pasar a la lámina 3.*

> «La recompra depende de quién se acuerda de pedir. Y a más de cuatro mil
> metros, un proveedor sin aptitud de altura no es un problema de precio: es un
> problema de seguridad.»

## 3. Solución — 0:35 a 1:00 (lámina 4)

> «Jumin es un consultor de compras para minería, con tres piezas. Una red de
> proveedores verificados, cada uno con un trust score de cero a cien que
> muestra de dónde sale. Alertas de stock contra el punto de reorden de cada
> insumo. Y un agente que recomienda a quién comprarle, y por qué.
> Con una regla dura: solo se recomienda a quien cumple todos los requisitos
> obligatorios de la categoría. Esa regla vive en la base de datos, no en el
> prompt.»

## 4. Demo — 1:00 a 1:50 (app en vivo)

*Pasar a la pestaña del panel (ya logueado).*

> «Este es el panel de la minera. Tres insumos en alerta. Respiradores: quedan
> 30 y el punto de reorden es 50.»

*En la alerta de «Respirador media cara con filtros P100», clic en **Pedir
recomendación**.*

> «Le pido una recomendación. Llega a la cola: Seguridad Puna, 45.800 pesos,
> entrega en 4 días, trust score 87, con su justificación.»

*Pasar a la pestaña de la ficha del insumo (`/insumos/<id del respirador>`).*

> «¿Por qué no la más barata? Acá están las ofertas lado a lado. BAC Dall cobra
> menos, pero tarda 10 días. Con el stock bajo el mínimo, el plazo pesa más.»

*Volver al panel y clic en **Aprobar**.*

> «Y la decisión es mía. El agente propone; la minera decide.»

## 5. Respaldo — 1:50 a 2:05 (lámina 6)

> «Nada de esto es maqueta: 277 proveedores relevados de CAPMIN con un scraper
> propio, 188 categorías y 58 reglas de requisitos. Y cero datos inventados: el
> agente solo lee de la base, y si le preguntan por el clima, se niega.»

## 6. Cierre — 2:05 a 2:30 (lámina 8)

> «El modelo es una suscripción por minera: procurement como servicio. Lo que
> sigue es cruzar registros públicos, como el de Jujuy y AFIP, e integrarnos
> con los ERPs de compras.
> Jumin no reemplaza al comprador: le devuelve las horas que hoy pierde entre
> PDFs. Cada recomendación se defiende con tres números: precio, lead time y
> trust score. Gracias.»

Texto hablado: unas 355 palabras, a un ritmo de ~150 palabras por minuto.
Si el ensayo pasa de 2:30, recortar primero la frase de la regla «en la base de
datos, no en el prompt» (tramo 3) y la de AFIP (tramo 6).

---

## Antes de subir (checklist)

- [ ] `pnpm supabase start` y `.env.local` apuntando a Supabase local. Las
      cifras del guion (3 alertas, respiradores 30/50, BAC Dall y Seguridad
      Puna) son del seed de Supabase; el seed en memoria tiene otros datos.
- [ ] Opcional: `pnpm supabase db reset` para limpiar recomendaciones de
      ensayos anteriores (borra lo cargado a mano en la base local).
- [ ] `pnpm dev` y entrar por **http://localhost:3000**, no por un proxy o
      preview: el login es una Server Action y falla con otro origen.
- [ ] Pestañas abiertas, en este orden:
  1. `http://localhost:3000/slide-deck.html` (flechas o espacio para avanzar)
  2. `http://localhost:3000/panel` con sesión iniciada
     (`comprador@salesdejujuy.ju-min.local` / `ju-min-demo`)
  3. `http://localhost:3000/insumos/ca47bee4-fe30-438f-a0b0-931123cdb091`
     (respirador; el id sale de la base local y cambia si se re-siembra)
- [ ] Ensayar con cronómetro al menos dos veces, demo incluida.

## Plan B

- **Si la demo falla o se cuelga:** volver al deck en la lámina 5 y narrar los
  cuatro pasos (alerta, consulta, recomendación, decisión) con las mismas
  frases del tramo 4. Mismo tiempo.
- **«Pedir recomendación» no depende del LLM:** usa la regla determinística
  del agente (confianza, plazo y precio), así que no hay latencia ni respuestas
  distintas en cada ensayo. El chat libre sí usa el modelo; no meterlo en los
  2:30.
- **Preguntas del jurado:** ver «Respuestas rápidas» en [pitch.md](pitch.md).
  La lámina 7 sirve de apoyo para preguntas técnicas.
