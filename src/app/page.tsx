import type { Metadata } from "next";
import Link from "next/link";
import {
  ArrowDown,
  ArrowRight,
  Check,
  ChevronDown,
  Fingerprint,
  Mountain,
  ScanLine,
  ShieldCheck,
  Sparkles,
  UserRoundCheck,
} from "lucide-react";
import { Estante3D } from "@/components/estante-3d";
import { LandingWidgets } from "@/components/landing-widgets";
import styles from "./landing.module.css";

export const metadata: Metadata = {
  description:
    "Consultor inteligente de compras para minería: proveedores verificados, certificaciones vigentes, trust score transparente y alertas de stock. El agente propone; la minera decide.",
};

export default function Landing() {
  return (
    <div className={styles.landing}>
      <section className={styles.hero} aria-labelledby="landing-titulo">
        <div className={styles.heroGrid}>
          <div className={styles.heroCopy}>
            <p className={styles.eyebrow}><span className={styles.signalIcon} aria-hidden="true" /> CONSULTOR INTELIGENTE DE COMPRAS PARA MINERÍA</p>
            <h1 id="landing-titulo">A quién comprar.<br /><span>Y por qué<br className={styles.desktopBreak} /> confiar.</span></h1>
            <p className={styles.heroDescription}>Proveedores verificados, alertas de stock y un agente que recomienda qué comprar, a quién y por qué. Con certificaciones vigentes, trust score transparente y aprobación humana.</p>
            <div className={styles.actions}>
              <Link href="/panel" className={styles.primaryButton}>Explorar el panel <ArrowRight size={17} /></Link>
              <a href="#como-funciona" className={styles.textButton}>Ver cómo funciona <ArrowDown size={15} /></a>
            </div>
            <p className={styles.heroNote}><ShieldCheck size={14} /> El agente recomienda. Tu equipo decide.</p>
          </div>
          <div className={styles.heroScene}>
            <div className={styles.sceneCoordinates} aria-hidden="true"><span>JUJUY, ARGENTINA</span><span>ABASTECIMIENTO / 01</span></div>
            <Estante3D />
            <div className={styles.sceneFootnote}><Mountain size={13} /><span>Diseñado para los desafíos de la minería.</span></div>
          </div>
        </div>
        <div className={styles.heroBottom}>
          <span>DE LA ALERTA A LA DECISIÓN</span>
          <div><span>01 <b>Anticipá faltantes</b></span><span className={styles.flowLine} aria-hidden="true" /><span>02 <b>Compará con criterio</b></span><span className={styles.flowLine} aria-hidden="true" /><span>03 <b>Decidí con respaldo</b></span></div>
          <a href="#como-funciona" aria-label="Conocer el circuito de Jumin"><ArrowDown size={17} /></a>
        </div>
      </section>

      <section className={styles.proof} aria-labelledby="problema-titulo">
        <div className={styles.problem}>
          <div><p className={styles.eyebrow}><span className={styles.sectionMarker} /> EL COSTO DE COMPRAR A CIEGAS</p><h2 id="problema-titulo">Un insumo faltante<br />puede parar una planta.</h2></div>
          <p>Elegir proveedor no es solo precio. Hay que revisar certificaciones ISO, estándares ESG y habilitaciones para alta montaña. Hoy, esa evidencia está dispersa entre listas, planillas y PDFs. En la Puna, comprar mal también es un riesgo de seguridad.</p>
        </div>
        <dl className={styles.evidenceStats}>
          <div><dt>Proveedores en la red</dt><dd>277</dd></div>
          <div><dt>Categorías de abastecimiento</dt><dd>188</dd></div>
          <div><dt>Reglas de requisitos</dt><dd>58</dd></div>
        </dl>
        <p className={styles.evidenceNote}>Relevamiento del proyecto: 271 proveedores incorporados desde el directorio público de CAPMIN. Estar en el catálogo no reemplaza la validación de requisitos para cada compra.</p>
      </section>

      <section id="como-funciona" className={styles.features} aria-labelledby="funciona-titulo">
        <div className={styles.sectionHeading}>
          <div><p className={styles.eyebrow}><span className={styles.sectionMarker} /> EL CIRCUITO JUMIN</p><h2 id="funciona-titulo">Tres piezas.<br />Una compra con respaldo.</h2></div>
          <p>La red de proveedores, las alertas de stock y el consultor en lenguaje natural trabajan juntos. De la alerta a la consulta, de la recomendación a tu decisión.</p>
        </div>
        <LandingWidgets />
      </section>

      <section className={styles.requirements} aria-labelledby="requisitos-titulo">
        <div className={styles.requirementsIntro}><p className={styles.eyebrow}><span className={styles.sectionMarker} /> LA REGLA DE ORO</p><h2 id="requisitos-titulo">Si no cumple,<br />no se recomienda.</h2><p>Un proveedor solo puede ser recomendado si cumple todos los requisitos obligatorios de la categoría del insumo. Las reglas viven en la base de datos, no en el prompt del agente.</p></div>
        <div className={styles.requirementsRules}>
          <p className={styles.rulesLabel}>REQUISITOS SEGÚN LA CATEGORÍA</p>
          <dl>
            <div><dt>Explosivos</dt><dd><ShieldCheck size={15} /> ANMaC</dd></div>
            <div><dt>Geomembranas</dt><dd><ShieldCheck size={15} /> GRI-GM13</dd></div>
            <div><dt>Protección personal</dt><dd><ShieldCheck size={15} /> IRAM</dd></div>
          </dl>
          <p className={styles.rulesNote}>Ejemplos de requisitos, no listas exhaustivas. Un certificado vencido deja de habilitar la recomendación.</p>
        </div>
      </section>

      <section className={styles.decisionSection} aria-labelledby="decision-titulo">
        <div className={styles.decisionCopy}>
          <p className={styles.eyebrow}><span className={styles.sectionMarker} /> INTELIGENCIA + CRITERIO HUMANO</p>
          <h2 id="decision-titulo">El agente propone.<br /><span>La minera decide.</span></h2>
          <p>Consultá, por ejemplo: «¿Quién me entrega respiradores más rápido?». El agente compara precio, plazo de entrega y trust score. Descargá el informe PDF con la justificación y adjuntalo a la orden de compra: la aprobación sigue en tu sistema.</p>
          <p>Datos separados por minera. Cada informe lleva un código que cualquiera puede verificar.</p>
          <Link href="/panel" className={styles.darkLink}>Conocé tu espacio de trabajo <ArrowRight size={16} /></Link>
        </div>
        <div className={styles.decisionDiagram} aria-label="El agente propone, una persona decide y la decisión queda registrada">
          <div className={styles.diagramTop}><span><Sparkles size={14} /> PROPUESTA DEL AGENTE</span><span className={styles.diagramTag}>Ejemplo ilustrativo</span></div>
          <div className={styles.proposal}><span className={styles.proposalIcon}><ScanLine size={24} /></span><div><strong>Reposición de respiradores</strong><span>Oferta, plazo y confianza comparados.</span></div><Check size={18} /></div>
          <div className={styles.approvalBridge} aria-hidden="true"><span /><UserRoundCheck size={18} /><span /></div>
          <div className={styles.humanDecision}><span className={styles.humanAvatar}>TU</span><div><strong>La última palabra es tuya.</strong><span>Revisar → Descargar informe → Aprobar en tu sistema</span></div><span className={styles.humanBadge}>Control humano</span></div>
          <p className={styles.auditTrail}><Fingerprint size={13} /> Decisión registrada. Historial consultable.</p>
        </div>
      </section>

      <section className={styles.network} aria-labelledby="red-titulo">
        <div className={styles.networkIntro}><p className={styles.eyebrow}><span className={styles.sectionMarker} /> CONFIANZA TRANSPARENTE</p><h2 id="red-titulo">Un puntaje.<br />Cuatro dimensiones.</h2><p>El trust score va de 0 a 100 y muestra su desglose, solo con datos verificables: identidad, compliance, ESG y capacidad. Consultá la ficha del proveedor, sus certificaciones y vencimientos antes de decidir.</p><Link href="/proveedores" className={styles.outlineButton}>Explorar proveedores <ArrowRight size={16} /></Link></div>
        <div className={styles.faq}>
          {[
            { n: "01", title: "¿Qué respalda una recomendación?", text: "Precio, plazo de entrega y trust score, siempre entre proveedores que cumplen los requisitos obligatorios del insumo. Si falta información, el agente debe decirlo: no completar datos ni inventar ofertas." },
            { n: "02", title: "¿Qué pasa si vence un certificado?", text: "La elegibilidad se comprueba por fecha de vigencia. Si una certificación obligatoria está vencida, el proveedor queda fuera de las recomendaciones para esa categoría." },
            { n: "03", title: "¿Es solo un chatbot?", text: "No. El chat es una interfaz del circuito de abastecimiento: stock, ofertas, requisitos, confianza e historial de decisiones. El agente está acotado a compras mineras; no es un asistente de propósito general." },
            { n: "04", title: "¿Los datos son reales? ¿La demo compra?", text: "La red combina proveedores relevados de fuentes públicas, como CAPMIN, con datos curados para la demostración. Las cifras de los widgets son ilustrativas y no describen una oferta real. Al ingresar podés probar el circuito; no se ejecutan compras ni pagos reales." },
          ].map(({ n, title, text }) => <details key={n} className={styles.faqItem}><summary><span>{n}</span><h3>{title}</h3><ChevronDown size={17} /></summary><p>{text}</p></details>)}
        </div>
      </section>

      <section className={styles.roadmap} aria-labelledby="modelo-titulo">
        <div className={styles.roadmapIntro}><p className={styles.eyebrow}><span className={styles.sectionMarker} /> MODELO Y PRÓXIMOS PASOS</p><h2 id="modelo-titulo">Tu consultor de compras,<br />como servicio.</h2><p>El modelo es una suscripción por minera. Hoy, el circuito llega de la alerta a la recomendación y a la decisión humana registrada.</p></div>
        <div className={styles.roadmapList}><p className={styles.rulesLabel}>ROADMAP / NO DISPONIBLE EN LA DEMO</p><ul><li>Verificación contra registros públicos de Jujuy y AFIP.</li><li>Conexión con APIs de compras públicas, como ChileCompra.</li><li>Integración con ERPs y facturación electrónica.</li><li>Orden de compra lista para aprobar, exportable al ERP.</li></ul></div>
      </section>

      <section className={styles.cta} aria-labelledby="cta-titulo">
        <span className={styles.ctaWatermark} aria-hidden="true"><Mountain strokeWidth={0.7} /></span>
        <p className={styles.eyebrow}>PROVEEDORES REALES. REGLAS CLARAS. DECISIÓN HUMANA.</p>
        <h2 id="cta-titulo">Menos horas verificando PDFs.<br />Más criterio para comprar.</h2>
        <Link href="/panel" className={styles.primaryButton}>Entrar al panel de Jumin <ArrowRight size={17} /></Link>
        <p className={styles.ctaNote}>Explorá la demo. Sin compras ni transacciones reales.</p>
      </section>
    </div>
  );
}
