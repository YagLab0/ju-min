/**
 * Respaldo SVG de la pieza 3D: dibuja el estante en su estado de alerta
 * (stock bajo del punto de reorden, baliza encendida y recomendación del
 * agente). Es lo que se ve hasta que el canvas renderiza y lo que queda
 * si WebGL no está disponible o el contexto se pierde.
 */
export function EstanteFallback({ className }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 640 480"
      className={className}
      focusable="false"
      role="presentation"
    >
      {/* sombra de piso */}
      <ellipse cx="268" cy="405" rx="210" ry="14" fill="var(--color-grafito)" opacity="0.55" />

      <g transform="translate(0,14)">
      {/* montantes */}
      <rect x="92" y="72" width="13" height="318" fill="var(--color-roca)" />
      <rect x="432" y="72" width="13" height="318" fill="var(--color-roca)" />

      {/* largueros (cobre) y bandejas */}
      {[308, 212, 116].map((y) => (
        <g key={y}>
          <rect x="92" y={y} width="353" height="11" fill="var(--color-cobre)" />
          <rect x="98" y={y - 5} width="341" height="5" fill="var(--color-roca)" />
        </g>
      ))}

      {/* Nivel inferior: quedan dos tambores; el hueco libra a la tarjeta */}
      {[118, 196].map((x) => (
        <g key={x}>
          <rect x={x} y={246} width="54" height="62" rx="5" fill="var(--color-cobre)" />
          <rect x={x} y={262} width="54" height="5" fill="var(--color-grafito)" />
          <rect x={x} y={286} width="54" height="5" fill="var(--color-grafito)" />
          <rect x={x} y={246} width="54" height="4" fill="var(--color-grafito)" opacity="0.7" />
        </g>
      ))}

      {/* columna de nivel con la marca del punto de reorden, ya cruzada */}
      <rect x="392" y="240" width="11" height="68" fill="var(--color-grafito)" />
      <rect x="394" y="282" width="7" height="26" fill="var(--color-senal)" />
      <rect x="386" y="279" width="23" height="4" fill="var(--color-senal)" />
      {/* franja de alerta bajo el nivel de los tambores */}
      <rect x="96" y="314" width="336" height="4" fill="var(--color-senal)" opacity="0.85" />

      {/* Nivel medio: dos bolsas de reactivo, filtro y bidón */}
      {[112, 178].map((x) => (
        <g key={x}>
          <rect x={x} y={156} width="52" height="56" rx="7" fill="var(--color-bruma)" />
          <rect x={x + 19} y={146} width="14" height="12" rx="3" fill="var(--color-bruma)" />
          <rect x={x + 12} y={172} width="28" height="18" rx="2" fill="var(--color-sal)" />
        </g>
      ))}
      <g>
        <rect x="288" y="158" width="40" height="54" fill="var(--color-sal)" />
        {[296, 306, 316].map((x) => (
          <line key={x} x1={x} y1="162" x2={x} y2="208" stroke="var(--color-bruma)" strokeWidth="3" />
        ))}
        <rect x="284" y="154" width="48" height="6" fill="var(--color-grafito)" />
        <rect x="284" y="210" width="48" height="6" fill="var(--color-grafito)" />
      </g>
      <g>
        <rect x="366" y="172" width="34" height="40" rx="3" fill="var(--color-cobre)" />
        <rect x="374" y="164" width="18" height="8" rx="2" fill="var(--color-grafito)" />
        <rect x="394" y="160" width="7" height="12" rx="2" fill="var(--color-grafito)" transform="rotate(18 397 166)" />
      </g>

      {/* Nivel superior: casco y caja de repuestos */}
      <g>
        <path d="M120 116 a27 22 0 0 1 54 0 z" fill="var(--color-sal)" />
        <rect x="112" y="113" width="70" height="5" rx="2" fill="var(--color-sal)" />
        <rect x="142" y="94" width="8" height="12" rx="2" fill="var(--color-sal)" />
      </g>
      <g>
        <rect x="238" y="86" width="62" height="30" fill="var(--color-bruma)" />
        <rect x="238" y="96" width="62" height="8" fill="var(--color-grafito)" opacity="0.75" />
      </g>

      {/* baliza encendida en lo alto del estante */}
      <g>
        <rect x="416" y="96" width="20" height="8" rx="2" fill="var(--color-grafito)" />
        <path d="M418 96 a8 9 0 0 1 16 0 z" fill="var(--color-senal)" />
        <g stroke="var(--color-senal)" strokeWidth="3" strokeLinecap="round">
          <line x1="426" y1="78" x2="426" y2="70" />
          <line x1="408" y1="86" x2="402" y2="79" />
          <line x1="444" y1="86" x2="450" y2="79" />
        </g>
      </g>

      {/* conector agente → alerta */}
      <line x1="470" y1="286" x2="410" y2="282" stroke="var(--color-senal)" strokeWidth="3" />

      {/* tarjeta del agente con la recomendación */}
      <g>
        <rect x="468" y="186" width="156" height="104" fill="var(--color-roca)" />
        <rect x="468" y="186" width="5" height="104" fill="var(--color-senal)" />
        <text x="484" y="205" fill="var(--color-bruma)" fontSize="10" fontFamily="var(--font-sans)">
          Agente ju-min
        </text>
        <text x="484" y="223" fill="var(--color-sal)" fontSize="13" fontWeight="700" fontFamily="var(--font-display)">
          Recomendación
        </text>
        <text x="484" y="241" fill="var(--color-sal)" fontSize="10" fontFamily="var(--font-sans)">
          Comprar 6 tambores de 200 L
        </text>
        <text x="484" y="256" fill="var(--color-bruma)" fontSize="9" fontFamily="var(--font-sans)">
          Lubricantes del Norte · Jujuy
        </text>
        <rect x="484" y="266" width="116" height="16" fill="var(--color-senal)" />
        <text x="492" y="278" fill="var(--color-grafito)" fontSize="9" fontWeight="700" fontFamily="var(--font-sans)">
          Trust score 92 · 4 días
        </text>
      </g>
      </g>
    </svg>
  );
}
