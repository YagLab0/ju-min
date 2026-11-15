# Guion del pitch — Jumin (2:30 min)

Versión corta del [pitch extendido](pitch.md), sin demo en vivo: el producto se
muestra en el [deck](../public/slide-deck.html) con un caso real de la base. Son
6 láminas más un anexo para preguntas. Las frases entre comillas se dicen; lo
demás es lo que pasa en pantalla.

| Tramo | Tiempo | Lámina | Idea |
|---|---|---|---|
| 1. Gancho | 0:00–0:15 | 1 | Sin respiradores, el turno no entra |
| 2. Problema | 0:15–0:40 | 2 | Evidencia en PDFs, recompra de memoria, riesgo en altura |
| 3. Cómo funciona | 0:40–1:25 | 3 | Detecta, compara, recomienda; la minera decide |
| 4. Confianza | 1:25–1:50 | 4 | Regla dura de requisitos y trust score con desglose |
| 5. Respaldo | 1:50–2:05 | 5 | Datos públicos, no maqueta |
| 6. Cierre | 2:05–2:30 | 6 | Modelo, próximos pasos y frase final |

El anexo (cómo está construido) queda después del cierre: solo se muestra si
hay preguntas técnicas.

---

## 1. Gancho — 0:00 a 0:15 (lámina 1)

*Al entrar, el stock de respiradores baja de 120 a 30 y cruza el punto de
reorden. Empezar a hablar con la animación.*

> «Imaginen que el turno no puede entrar a la mina porque se acabaron los
> respiradores. Cada uno cuesta unos miles de pesos. La mina parada cuesta
> miles de dólares por hora. Jumin existe para que eso no pase.»

## 2. Problema — 0:15 a 0:40 (lámina 2)

> «Hoy, quien compra en una minera valida cada proveedor a mano. Las
> certificaciones ISO, ESG y las habilitaciones viven en PDFs y correos, y
> nadie sabe si siguen vigentes. La recompra depende de quién se acuerda de
> pedir. Y a más de cuatro mil metros, un proveedor sin aptitud de altura no es
> un problema de precio: es un problema de seguridad.»

## 3. Cómo funciona — 0:40 a 1:25 (lámina 3)

*Los cuatro pasos aparecen en orden; acompañarlos con la voz.*

> «Jumin es un consultor de compras para minería, y funciona en cuatro pasos.
> Uno, detecta: los respiradores bajan a 30, el punto de reorden es 50, y salta
> la alerta.
> Dos, compara las ofertas de proveedores verificados que cumplen los
> requisitos de la categoría; acá, ISO 9001 e IRAM-EPP.
> Tres, recomienda con justificación: Seguridad Puna. Cuesta un 7 % más que BAC
> Dall, pero entrega 6 días antes, y con el stock bajo el mínimo el plazo pesa
> más.
> Cuatro, la recomendación queda pendiente. Nada se compra sin que la minera
> la apruebe.»

## 4. Confianza — 1:25 a 1:50 (lámina 4)

> «La confianza no es una opinión. Cada proveedor tiene un trust score de cero
> a cien con su desglose: identidad, compliance, desempeño, ESG y capacidad. Y
> hay una regla dura: explosivos exigen ANMaC, geomembranas GRI-GM13, EPP
> certificación IRAM. Si falta un requisito obligatorio, el proveedor no entra.
> Esa regla vive en la base de datos, no en el prompt.»

## 5. Respaldo — 1:50 a 2:05 (lámina 5)

> «Y nada de esto es maqueta: 277 proveedores relevados de CAPMIN con un
> scraper propio, 188 categorías y 58 reglas de requisitos. El agente solo lee
> de la base: si no tiene el dato, lo dice.»

## 6. Cierre — 2:05 a 2:30 (lámina 6)

> «El modelo es una suscripción por minera. Lo próximo es cruzar registros
> públicos, como el de Jujuy y AFIP, e integrarnos con los ERPs de compras.
> Jumin no reemplaza al comprador: le devuelve las horas que hoy pierde entre
> PDFs. El agente propone; la minera decide. Gracias.»

Texto hablado: unas 335 palabras, a un ritmo de ~150 palabras por minuto.
Si el ensayo pasa de 2:30, recortar primero «Esa regla vive en la base de
datos, no en el prompt» (tramo 4) y la frase de AFIP y ERPs (tramo 6).

---

## Antes de subir

- [ ] Abrir el deck desde la app (`/slide-deck.html` con `pnpm dev`, o la URL
      desplegada), no como archivo suelto: las tipografías se sirven desde
      `/deck/`.
- [ ] Pantalla completa (F11) y arrancar en la lámina 1. Avanzar con flecha
      derecha, espacio o clic; retroceder con flecha izquierda.
- [ ] Volver a entrar a la lámina 1 justo antes de hablar: la animación del
      stock corre cada vez que la lámina aparece.
- [ ] Ensayar con cronómetro al menos dos veces.

## Plan B

- **Si falla la notebook o el proyector:** el pitch no depende de la pantalla.
  Decir el mismo texto; las cifras clave son 30 y 50 (stock y punto de
  reorden), 7 % y 6 días (la recomendación) y 277, 188 y 58 (los datos).
- **Preguntas técnicas:** pasar al anexo, después de la lámina 6.
- **Preguntas del jurado:** ver «Respuestas rápidas» en [pitch.md](pitch.md).
