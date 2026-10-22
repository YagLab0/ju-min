import type * as Three from "three";

/**
 * Previews 3D de insumos para las cards (estilo producto, rotación lenta).
 *
 * A diferencia de Estante3D (una escena por pieza), las cards son muchas y el
 * navegador limita los contextos WebGL (~8–16). Acá hay UN solo renderer
 * offscreen compartido: cada preview registrada blitea el frame del renderer a
 * su propio canvas 2D. Las escenas se cachean por arquetipo, así diez cards del
 * mismo insumo cuestan un solo render por frame.
 *
 * Si el contexto se pierde o three no carga, el host nunca recibe
 * `data-rendered` y queda el patrón CSS de respaldo debajo del canvas.
 */

export const ARQUETIPOS_INSUMO = [
  "tambor",
  "bigbag",
  "bidon",
  "filtro",
  "rollo",
  "caja",
  "casco",
  "bola",
  "viga",
] as const;

export type ArquetipoInsumo = (typeof ARQUETIPOS_INSUMO)[number];

/** Modelo representativo para un insumo: primero por nombre, después por
 * categoría; la caja es el fallback honesto (la mayoría llega embalada). */
export function arquetipoParaInsumo(
  nombre: string,
  categoriaSlug?: string,
): ArquetipoInsumo {
  const n = nombre.toLowerCase();
  if (/casco/.test(n)) return "casco";
  if (/filtro/.test(n)) return "filtro";
  if (/bola/.test(n)) return "bola";
  if (/geomembrana|correa|cinta|manguera|cable|lona/.test(n)) return "rollo";
  if (/cianuro|floculante|big bag|saco|cemento|cal\b/.test(n)) return "bigbag";
  if (/aceite|lubricante|grasa|bid[oó]n|envase/.test(n)) return "bidon";
  if (/[aá]cido|tambor|barril|combustible|di[eé]sel/.test(n)) return "tambor";

  switch (categoriaSlug) {
    case "combustibles":
      return "tambor";
    case "lubricantes":
      return "bidon";
    case "reactivos":
      return "bigbag";
    case "medios-molienda":
      return "bola";
    case "filtros":
      return "filtro";
    case "geomembranas":
    case "transporte":
      return "rollo";
    case "estructuras":
      return "viga";
    default:
      return "caja";
  }
}

type EntradaPreview = {
  host: HTMLElement;
  canvas: HTMLCanvasElement;
  ctx: CanvasRenderingContext2D;
  arquetipo: ArquetipoInsumo;
  /** Tamaño del buffer 2D en px físicos; se sincroniza en resize, no por frame. */
  w: number;
  h: number;
  visible: boolean;
};

type EscenaCache = {
  scene: Three.Scene;
  camera: Three.PerspectiveCamera;
  grupo: Three.Group;
};

const ANGULO_FIJO = 0.55;
const DURACION_VUELTA = 16000;
const DPR_MAX = 1.5;

let three: typeof Three | null = null;
let renderer: Three.WebGLRenderer | null = null;
let rendererW = 0;
let rendererH = 0;
let failed = false;
let raf = 0;
let previousTime: number | null = null;
let tiempo = 0;

const previews = new Set<EntradaPreview>();
const escenas = new Map<ArquetipoInsumo, EscenaCache>();
let paletas:
  | Record<
      "tinta" | "marco" | "claro" | "tenue" | "senal" | "cobre" | "piso",
      Three.Color
    >
  | null = null;
let observerVisibilidad: IntersectionObserver | null = null;
let observerResize: ResizeObserver | null = null;
let mediaReduced: MediaQueryList | null = null;

function cssColor(token: string): Three.Color {
  const value = getComputedStyle(document.documentElement)
    .getPropertyValue(token)
    .trim();
  return new three!.Color().setStyle(value || "#000000");
}

function obtenerRenderer(): Three.WebGLRenderer | null {
  if (failed || !three) return null;
  if (renderer) return renderer;
  const canvas = document.createElement("canvas");
  const context = canvas.getContext("webgl2", {
    alpha: true,
    antialias: true,
  });
  if (!context) {
    failed = true;
    return null;
  }
  renderer = new three.WebGLRenderer({
    canvas,
    context,
    alpha: true,
    antialias: true,
    powerPreference: "low-power",
  });
  renderer.outputColorSpace = three.SRGBColorSpace;
  renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, DPR_MAX));
  renderer.domElement.addEventListener(
    "webglcontextlost",
    (event) => {
      event.preventDefault();
      failed = true;
      for (const entrada of previews) delete entrada.host.dataset.rendered;
      detenerLoop();
    },
    { once: true },
  );
  return renderer;
}

function construirModelo(
  arquetipo: ArquetipoInsumo,
  mat: Record<string, Three.MeshStandardMaterial>,
): Three.Group {
  const g = new three!.Group();
  const mesh = (
    geometry: Three.BufferGeometry,
    material: Three.Material,
    transform?: (m: Three.Mesh) => void,
  ) => {
    const m = new three!.Mesh(geometry, material);
    transform?.(m);
    g.add(m);
    return m;
  };

  switch (arquetipo) {
    case "tambor": {
      mesh(new three!.CylinderGeometry(0.3, 0.3, 0.56, 40), mat.cobre);
      for (const y of [-0.14, 0.14]) {
        mesh(new three!.TorusGeometry(0.303, 0.014, 8, 40), mat.tinta, (m) => {
          m.rotation.x = Math.PI / 2;
          m.position.y = y;
        });
      }
      for (const x of [-0.11, 0.11]) {
        mesh(new three!.CylinderGeometry(0.045, 0.045, 0.035, 16), mat.tinta, (m) =>
          m.position.set(x, 0.295, 0),
        );
      }
      break;
    }
    case "bigbag": {
      // Saco de sección cuadrada: cilindro de 4 caras con normales suaves.
      const cuerpo = mesh(
        new three!.CylinderGeometry(0.3, 0.34, 0.52, 4, 4),
        mat.claro,
        (m) => (m.rotation.y = Math.PI / 4),
      );
      cuerpo.geometry.computeVertexNormals();
      mesh(new three!.CylinderGeometry(0.09, 0.13, 0.1, 16), mat.claro, (m) =>
        m.position.set(0, 0.31, 0),
      );
      for (const x of [-0.18, 0.18]) {
        mesh(new three!.TorusGeometry(0.075, 0.018, 8, 20, Math.PI), mat.tinta, (m) =>
          m.position.set(x, 0.29, 0),
        );
      }
      break;
    }
    case "bidon": {
      mesh(new three!.BoxGeometry(0.3, 0.48, 0.21), mat.senal);
      mesh(new three!.BoxGeometry(0.31, 0.05, 0.22), mat.senal, (m) =>
        m.position.set(0, 0.14, 0),
      );
      mesh(new three!.CylinderGeometry(0.055, 0.055, 0.05, 16), mat.tinta, (m) =>
        m.position.set(-0.08, 0.27, 0),
      );
      mesh(new three!.BoxGeometry(0.16, 0.045, 0.05), mat.tinta, (m) =>
        m.position.set(0.05, 0.265, 0),
      );
      // Etiqueta frontal, como los bidones de lubricante.
      mesh(new three!.PlaneGeometry(0.17, 0.2), mat.claro, (m) =>
        m.position.set(0, -0.02, 0.106),
      );
      mesh(new three!.PlaneGeometry(0.13, 0.05), mat.tinta, (m) =>
        m.position.set(0, -0.06, 0.107),
      );
      break;
    }
    case "filtro": {
      mesh(new three!.CylinderGeometry(0.16, 0.16, 0.4, 32), mat.tenue);
      for (const y of [-0.2, 0.2]) {
        mesh(new three!.CylinderGeometry(0.168, 0.168, 0.04, 32), mat.tinta, (m) =>
          m.position.set(0, y, 0),
        );
      }
      mesh(new three!.CylinderGeometry(0.163, 0.163, 0.1, 32), mat.senal);
      // Aletas del medio filtrante.
      for (const y of [-0.14, -0.08, 0.08, 0.14]) {
        mesh(new three!.TorusGeometry(0.161, 0.005, 6, 32), mat.marco, (m) => {
          m.rotation.x = Math.PI / 2;
          m.position.y = y;
        });
      }
      break;
    }
    case "rollo": {
      mesh(new three!.CylinderGeometry(0.19, 0.19, 0.52, 36), mat.tinta, (m) =>
        m.rotation.set(0, 0, Math.PI / 2),
      );
      mesh(new three!.CylinderGeometry(0.06, 0.06, 0.56, 16), mat.tenue, (m) =>
        m.rotation.set(0, 0, Math.PI / 2),
      );
      // Punta de la lámina asomando por debajo del rollo.
      mesh(new three!.BoxGeometry(0.54, 0.015, 0.16), mat.marco, (m) =>
        m.position.set(0, -0.19, 0.05),
      );
      break;
    }
    case "casco": {
      mesh(
        new three!.SphereGeometry(0.21, 40, 20, 0, Math.PI * 2, 0, Math.PI / 2),
        mat.senal,
      );
      mesh(new three!.CylinderGeometry(0.27, 0.27, 0.035, 40), mat.senal, (m) =>
        m.position.set(0, -0.005, 0),
      );
      // Cresta longitudinal: queda semihundida en el domo.
      mesh(new three!.BoxGeometry(0.06, 0.05, 0.38), mat.senal, (m) =>
        m.position.set(0, 0.185, 0),
      );
      // Porta-lámpara frontal.
      mesh(new three!.BoxGeometry(0.08, 0.07, 0.04), mat.tinta, (m) =>
        m.position.set(0, 0.04, 0.22),
      );
      break;
    }
    case "bola": {
      // Pilón de bolas de molienda: tres abajo, una arriba.
      const geo = new three!.SphereGeometry(0.13, 28, 16);
      for (const [x, y, z] of [
        [-0.13, -0.13, 0],
        [0.13, -0.13, 0],
        [0, -0.13, -0.22],
        [0, 0.1, -0.07],
      ]) {
        mesh(geo, mat.tinta, (m) => m.position.set(x, y, z));
      }
      break;
    }
    case "viga": {
      for (const y of [-0.13, 0.13]) {
        mesh(new three!.BoxGeometry(0.55, 0.05, 0.17), mat.marco, (m) =>
          m.position.set(0, y, 0),
        );
      }
      mesh(new three!.BoxGeometry(0.55, 0.22, 0.05), mat.marco);
      break;
    }
    case "caja":
    default: {
      mesh(new three!.BoxGeometry(0.44, 0.28, 0.3), mat.tenue);
      mesh(new three!.BoxGeometry(0.44, 0.045, 0.3), mat.claro, (m) =>
        m.position.set(0, 0.16, 0),
      );
      // Cinta de embalaje sobre la tapa.
      mesh(new three!.BoxGeometry(0.445, 0.014, 0.1), mat.cobre, (m) =>
        m.position.set(0, 0.188, 0),
      );
      mesh(new three!.PlaneGeometry(0.15, 0.1), mat.senal, (m) =>
        m.position.set(0, 0, 0.151),
      );
      break;
    }
  }
  return g;
}

function obtenerEscena(arquetipo: ArquetipoInsumo): EscenaCache | null {
  const cacheada = escenas.get(arquetipo);
  if (cacheada) return cacheada;
  if (!three) return null;
  if (!paletas) {
    paletas = {
      tinta: cssColor("--escena-tinta"),
      marco: cssColor("--escena-estante"),
      claro: cssColor("--escena-claro"),
      tenue: cssColor("--escena-tenue"),
      senal: cssColor("--escena-senal"),
      cobre: cssColor("--escena-cobre"),
      piso: cssColor("--escena-piso"),
    };
  }

  const scene = new three.Scene();
  scene.add(new three.HemisphereLight(paletas.claro, paletas.tinta, 1.1));
  const keyLight = new three.DirectionalLight(paletas.claro, 1.9);
  keyLight.position.set(-3.5, 6, 4.5);
  scene.add(keyLight);
  const fillLight = new three.DirectionalLight(paletas.tenue, 0.5);
  fillLight.position.set(4, 1.5, -2);
  scene.add(fillLight);

  const std = (
    color: Three.Color,
    extra: Partial<Three.MeshStandardMaterialParameters> = {},
  ) =>
    new three!.MeshStandardMaterial({ color, roughness: 0.75, ...extra });
  const mat = {
    tinta: std(paletas.tinta, { roughness: 0.55, metalness: 0.3 }),
    marco: std(paletas.marco, { roughness: 0.85 }),
    claro: std(paletas.claro),
    tenue: std(paletas.tenue, { roughness: 0.95 }),
    senal: std(paletas.senal, { roughness: 0.6 }),
    cobre: std(paletas.cobre, { roughness: 0.55, metalness: 0.25 }),
  } satisfies Record<string, Three.MeshStandardMaterial>;

  const grupo = construirModelo(arquetipo, mat);
  // Escala uniforme: cada modelo ocupa ~0.78 unidades de alto y queda centrado
  // en el origen; con la cámara elevada la profundidad proyecta altura extra,
  // así que se deja margen para que el modelo no roce los bordes del strip.
  const caja = new three.Box3().setFromObject(grupo);
  const alto = caja.max.y - caja.min.y;
  const escala = 0.78 / alto;
  grupo.scale.setScalar(escala);
  grupo.position.y = -((caja.max.y + caja.min.y) / 2) * escala;
  scene.add(grupo);

  // Sombra suave bajo el objeto, como en el estante.
  const sombra = new three.Mesh(
    new three.CircleGeometry(0.5, 40),
    new three.MeshBasicMaterial({
      color: paletas.tinta,
      transparent: true,
      opacity: 0.08,
      depthWrite: false,
    }),
  );
  sombra.rotation.x = -Math.PI / 2;
  sombra.scale.y = 0.55;
  sombra.position.y = caja.min.y * escala - 0.04;
  scene.add(sombra);

  const camera = new three.PerspectiveCamera(30, 3, 0.1, 30);
  camera.position.set(1.5, 1.25, 2.1);
  camera.lookAt(0, -0.02, 0);

  const entrada = { scene, camera, grupo };
  escenas.set(arquetipo, entrada);
  return entrada;
}

function medir(entrada: EntradaPreview) {
  const { width, height } = entrada.host.getBoundingClientRect();
  const dpr = Math.min(window.devicePixelRatio || 1, DPR_MAX);
  entrada.w = Math.round(width * dpr);
  entrada.h = Math.round(height * dpr);
  // El blit dibuja a tamaño natural: el buffer 2D tiene que coincidir con el
  // frame del renderer o drawImage recorta y el CSS deforma.
  if (entrada.w > 0 && entrada.h > 0) {
    entrada.canvas.width = entrada.w;
    entrada.canvas.height = entrada.h;
  }
}

function anguloActual() {
  return ANGULO_FIJO + (tiempo / DURACION_VUELTA) * Math.PI * 2;
}

/** Renderiza las entradas agrupadas por tamaño: un solo setSize por grupo
 * evita reallocar el buffer del renderer a cada card. */
function dibujarGrupo(entradas: EntradaPreview[], angulo: number) {
  const render = obtenerRenderer();
  if (!render) return;
  const porTamaño = new Map<string, EntradaPreview[]>();
  for (const entrada of entradas) {
    if (!entrada.w || !entrada.h) continue;
    const clave = `${entrada.w}x${entrada.h}`;
    const grupo = porTamaño.get(clave);
    if (grupo) grupo.push(entrada);
    else porTamaño.set(clave, [entrada]);
  }
  const dpr = Math.min(window.devicePixelRatio || 1, DPR_MAX);
  for (const [clave, grupo] of porTamaño) {
    const [w, h] = clave.split("x").map(Number);
    if (w !== rendererW || h !== rendererH) {
      // w/h ya están en px físicos: setSize toma px CSS y multiplica por el
      // pixelRatio del renderer (el mismo dpr que usó medir).
      render.setSize(w / dpr, h / dpr, false);
      rendererW = w;
      rendererH = h;
    }
    for (const entrada of grupo) {
      const escena = obtenerEscena(entrada.arquetipo);
      if (!escena) continue;
      escena.grupo.rotation.y = angulo;
      escena.camera.aspect = w / h;
      escena.camera.updateProjectionMatrix();
      render.render(escena.scene, escena.camera);
      entrada.ctx.drawImage(render.domElement, 0, 0);
      entrada.host.dataset.rendered = "true";
    }
  }
}

const estatico = () => (mediaReduced?.matches ?? false) || failed;

function algunaVisible() {
  for (const entrada of previews) if (entrada.visible) return true;
  return false;
}

function visibles(): EntradaPreview[] {
  const lista: EntradaPreview[] = [];
  for (const entrada of previews) if (entrada.visible) lista.push(entrada);
  return lista;
}

function detenerLoop() {
  window.cancelAnimationFrame(raf);
  raf = 0;
  previousTime = null;
}

function tick(time: number) {
  raf = 0;
  if (estatico() || !algunaVisible() || document.visibilityState !== "visible") {
    detenerLoop();
    return;
  }
  if (previousTime !== null) tiempo += time - previousTime;
  previousTime = time;
  dibujarGrupo(visibles(), anguloActual());
  if (!raf) raf = window.requestAnimationFrame(tick);
}

function actualizarLoop() {
  if (estatico() || !algunaVisible() || document.visibilityState !== "visible") {
    detenerLoop();
    return;
  }
  if (!raf) raf = window.requestAnimationFrame(tick);
}

function redibujarEstatico(entrada: EntradaPreview) {
  medir(entrada);
  dibujarGrupo([entrada], ANGULO_FIJO);
}

/**
 * Registra una card de preview: blitea el primer frame cuando el host entra al
 * viewport y lo anima mientras siga visible. Devuelve la baja o `null` si no
 * hay WebGL (el host conserva el patrón de respaldo).
 */
export function registrarPreview(
  threeModule: typeof Three,
  params: {
    host: HTMLElement;
    canvas: HTMLCanvasElement;
    arquetipo: ArquetipoInsumo;
  },
): (() => void) | null {
  three = threeModule;
  const ctx = params.canvas.getContext("2d");
  if (!ctx || !obtenerRenderer()) return null;

  if (!mediaReduced) {
    mediaReduced = window.matchMedia("(prefers-reduced-motion: reduce)");
    mediaReduced.addEventListener("change", () => {
      if (estatico()) for (const p of visibles()) redibujarEstatico(p);
      actualizarLoop();
    });
    document.addEventListener("visibilitychange", actualizarLoop);
  }

  const entrada: EntradaPreview = {
    ...params,
    ctx,
    w: 0,
    h: 0,
    visible: false,
  };
  medir(entrada);
  previews.add(entrada);

  if (!observerVisibilidad) {
    observerVisibilidad = new IntersectionObserver(
      (items) => {
        for (const item of items) {
          const host = item.target as HTMLElement;
          for (const p of previews) {
            if (p.host === host) p.visible = item.isIntersecting;
          }
        }
        if (estatico()) for (const p of visibles()) redibujarEstatico(p);
        actualizarLoop();
      },
      { threshold: 0.05, rootMargin: "120px" },
    );
  }
  observerVisibilidad.observe(entrada.host);

  if (!observerResize) {
    observerResize = new ResizeObserver((items) => {
      for (const item of items) {
        const host = item.target as HTMLElement;
        for (const p of previews) {
          if (p.host === host) {
            medir(p);
            if (p.visible && estatico()) redibujarEstatico(p);
          }
        }
      }
    });
  }
  observerResize.observe(entrada.host);

  return () => {
    previews.delete(entrada);
    observerVisibilidad?.unobserve(entrada.host);
    observerResize?.unobserve(entrada.host);
    delete entrada.host.dataset.rendered;
    if (previews.size === 0) detenerLoop();
  };
}
