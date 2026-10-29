"use client";

import { useState } from "react";
import {
  ArrowDownRight,
  ArrowUpRight,
  Check,
  CircleCheck,
  Clock3,
  Package,
  Pause,
  Play,
  ShieldCheck,
  Sparkles,
} from "lucide-react";
import styles from "./landing-widgets.module.css";

export function LandingWidgets() {
  const [paused, setPaused] = useState(false);

  return (
    <div className={styles.demos} data-paused={paused}>
      <div className={styles.toolbar}>
        <p><span className={styles.liveDot} /> Así se conecta todo <span className={styles.example}>/ Ejemplo ilustrativo</span></p>
        <button type="button" onClick={() => setPaused(!paused)} aria-pressed={paused}>
          {paused ? <Play size={13} /> : <Pause size={13} />}
          {paused ? "Reanudar demos" : "Pausar demos"}
        </button>
      </div>

      <div className={styles.grid}>
        <article className={styles.card}>
          <div className={styles.visual}>
            <div className={styles.widgetHeader}><span><Package size={14} /> ALMACÉN / EPP</span><span className={styles.counter}>01</span></div>
            <div className={styles.stockTitle}><span>Respiradores</span><span className={styles.stockBadge}>Reponer</span></div>
            <div className={styles.stockNumber}>120 <span>unidades disponibles</span><ArrowDownRight size={22} /></div>
            <div className={styles.stockChart} aria-hidden="true">
              <div className={styles.chartGrid} />
              <div className={styles.threshold}><span>Punto de reorden · 200</span></div>
              <div className={styles.bars}>
                {[94, 90, 83, 87, 75, 67, 72, 58, 47, 40, 32, 27].map((height, i) => (
                  <span key={i} style={{ height: `${height}%`, animationDelay: `${i * 0.12}s` }} />
                ))}
              </div>
              <div className={styles.chartSweep} />
            </div>
            <div className={styles.chartFooter}><span>12 días de margen</span><span>Bajo punto de reorden <ArrowDownRight size={12} /></span></div>
          </div>
          <div className={styles.copy}><span className={styles.step}>01 / ALERTA DE STOCK</span><h3>Antes de que la planta pare.</h3><p>Cargá el stock y el punto de reorden por insumo. Jumin detecta qué está por faltar y cuántos días de margen quedan.</p></div>
        </article>

        <article className={styles.card}>
          <div className={`${styles.visual} ${styles.supplierVisual}`}>
            <div className={styles.widgetHeader}><span><ShieldCheck size={14} /> RED DE PROVEEDORES</span><span className={styles.counter}>02</span></div>
            <div className={styles.supplierCard}>
              <div className={styles.supplierIdentity}><div className={styles.monogram}>PA<span /></div><div><strong>Proveedor de ejemplo</strong><span>Jujuy, Argentina</span></div><CircleCheck size={17} /></div>
              <div className={styles.scoreRow}>
                <div className={styles.scoreRing}><svg viewBox="0 0 100 100" aria-hidden="true"><circle cx="50" cy="50" r="43" /><circle className={styles.scoreArc} cx="50" cy="50" r="43" pathLength="100" /></svg><strong>92<span>/ 100</span></strong></div>
                <div className={styles.scoreLabel}><strong>Elegible para EPP.</strong><span>Trust score desglosado</span></div>
              </div>
              <div className={styles.checks}><span><Check size={12} /> ISO 9001</span><span><Check size={12} /> IRAM</span><span><Check size={12} /> Vigentes</span></div>
              <div className={styles.verificationLine} aria-hidden="true" />
            </div>
          </div>
          <div className={styles.copy}><span className={styles.step}>02 / RED VERIFICADA</span><h3>Confianza que se puede revisar.</h3><p>Un trust score de 0 a 100, desglosado en identidad, compliance, ESG y capacidad. Más certificaciones y vigencias, no solo precio.</p></div>
        </article>

        <article className={styles.card}>
          <div className={`${styles.visual} ${styles.agentVisual}`}>
            <div className={styles.widgetHeader}><span><Sparkles size={14} /> CONSULTOR DE COMPRAS</span><span className={styles.counter}>03</span></div>
            <div className={styles.question}>¿Quién me entrega respiradores más rápido?<ArrowUpRight size={14} /></div>
            <div className={styles.answer}>
              <span className={styles.agentMark}><Sparkles size={14} /></span>
              <div><strong>El plazo hace la diferencia.</strong><p>Menor plazo entre ofertas elegibles, con precio y confianza a la vista.</p></div>
            </div>
            <div className={styles.offerMetrics}><div><span>PRECIO</span><strong>$ 4.800<small>/ un.</small></strong></div><div><span><Clock3 size={10} /> ENTREGA</span><strong>3 <small>días</small></strong></div><div><span>TRUST SCORE</span><strong>92<small>/100</small></strong></div></div>
            <div className={styles.pending}><span className={styles.pendingDot} /> Esperando tu decisión <span>→</span></div>
          </div>
          <div className={styles.copy}><span className={styles.step}>03 / RECOMENDACIÓN JUSTIFICADA</span><h3>Qué comprar, a quién y por qué.</h3><p>Consultá en lenguaje natural. El agente compara precio, plazo de entrega y trust score, y explica el criterio. Tu equipo aprueba o rechaza.</p></div>
        </article>
      </div>
    </div>
  );
}
