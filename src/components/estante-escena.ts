import type * as Three from "three";

export type EstanteScene = {
  resize: () => void;
  /** Aplica el estado de la secuencia para un instante del ciclo (segundos). */
  pose: (tiempo: number) => void;
  render: () => boolean;
  dispose: () => void;
};

export const DURACION_CICLO = 14;
/** Instante del ciclo con la alerta encendida y la recomendación visible. */
export const INSTANTE_ALERTA = 8.6;

// Tiempos del ciclo: stock lleno → drenado → alerta → recomendación → reposición.
const T_DRENA_INI = 1.4;
const T_DRENA_FIN = 6.0;
const NIVEL_FINAL = 0.36; // el nivel queda apenas por debajo del punto de reorden
const PUNTO_REORDEN = 0.4;
const T_ALERTA_FIN = 11.7;
const T_TARJETA_INI = 6.4;
const T_TARJETA_DUR = 0.9;
const T_TARJETA_FIN = 11.7;
const T_REPONE_INI = 12.0;
const T_REPONE_FIN = 13.1;

const TAMBORES = 4;
const TAMBOR_H = 0.62;
const TAMBOR_R = 0.24;
const NIVEL_H = 0.72;

const clamp01 = (v: number) => Math.max(0, Math.min(1, v));
const ease = (t: number) => t * t * (3 - 2 * t);

export function createEstanteScene(
  three: typeof Three,
  canvas: HTMLCanvasElement,
  host: HTMLDivElement
): EstanteScene | null {
  const context = canvas.getContext("webgl2", { alpha: true, antialias: true });
  if (!context) return null;

  const renderer = new three.WebGLRenderer({
    canvas,
    context,
    alpha: true,
    antialias: true,
    powerPreference: "low-power",
  });
  const geometries = new Set<Three.BufferGeometry>();
  const materials = new Set<Three.Material>();
  const textures = new Set<Three.Texture>();
  const ownGeometry = <T extends Three.BufferGeometry>(geometry: T): T => {
    geometries.add(geometry);
    return geometry;
  };
  const ownMaterial = <T extends Three.Material>(material: T): T => {
    materials.add(material);
    return material;
  };
  function dispose() {
    geometries.forEach((geometry) => geometry.dispose());
    materials.forEach((material) => material.dispose());
    textures.forEach((texture) => texture.dispose());
    renderer.dispose();
    renderer.forceContextLoss();
  }

  try {
    const computed = getComputedStyle(host);
    function cssColor(token: string) {
      const value = computed.getPropertyValue(token).trim() || "#000000";
      // setStyle interpreta hex/rgb() del CSS y convierte al espacio de trabajo.
      return { css: value, color: new three.Color().setStyle(value) };
    }
    const tinta = cssColor("--escena-tinta");
    const marco = cssColor("--escena-estante");
    const piso = cssColor("--escena-piso");
    const claro = cssColor("--escena-claro");
    const tenue = cssColor("--escena-tenue");
    const senal = cssColor("--escena-senal");
    const cobre = cssColor("--escena-cobre");
    const panel = cssColor("--escena-panel");
    const textoSuave = cssColor("--escena-texto-suave");

    const scene = new three.Scene();
    const camera = new three.PerspectiveCamera(30, 1, 0.1, 40);
    renderer.setClearColor(tinta.color, 0);
    renderer.outputColorSpace = three.SRGBColorSpace;

    scene.add(new three.HemisphereLight(claro.color, tinta.color, 1.1));
    const keyLight = new three.DirectionalLight(claro.color, 1.9);
    keyLight.position.set(-3.5, 6, 4.5);
    scene.add(keyLight);
    const fillLight = new three.DirectionalLight(tenue.color, 0.5);
    fillLight.position.set(4, 1.5, -2);
    scene.add(fillLight);

    const matRoca = ownMaterial(
      new three.MeshStandardMaterial({ color: marco.color, roughness: 0.85 })
    );
    const matOscuro = ownMaterial(
      new three.MeshStandardMaterial({ color: tinta.color, roughness: 0.9 })
    );
    const matCobre = ownMaterial(
      new three.MeshStandardMaterial({
        color: cobre.color,
        roughness: 0.55,
        metalness: 0.25,
      })
    );
    const matSal = ownMaterial(
      new three.MeshStandardMaterial({ color: claro.color, roughness: 0.7 })
    );
    const matBruma = ownMaterial(
      new three.MeshStandardMaterial({ color: tenue.color, roughness: 0.95 })
    );
    const matSenal = ownMaterial(
      new three.MeshStandardMaterial({
        color: senal.color,
        roughness: 0.5,
        emissive: senal.color,
        emissiveIntensity: 0.25,
      })
    );

    const box = (w: number, h: number, d: number) =>
      ownGeometry(new three.BoxGeometry(w, h, d));
    const cylinder = (rt: number, rb: number, h: number, seg = 24) =>
      ownGeometry(new three.CylinderGeometry(rt, rb, h, seg));

    // --- Estantería industrial: montantes, largueros cobre y bandejas ---
    const estante = new three.Group();
    scene.add(estante);

    const MEDIA_ANCHURA = 1.6;
    const MEDIA_PROF = 0.42;
    const NIVELES = [0.24, 1.26, 2.28];
    const ALTURA_MONTANTE = 2.58;

    const montanteGeo = box(0.09, ALTURA_MONTANTE, 0.09);
    for (const x of [-MEDIA_ANCHURA, MEDIA_ANCHURA]) {
      for (const z of [-MEDIA_PROF, MEDIA_PROF]) {
        const montante = new three.Mesh(montanteGeo, matRoca);
        montante.position.set(x, ALTURA_MONTANTE / 2, z);
        estante.add(montante);
      }
    }
    const largueroGeo = box(MEDIA_ANCHURA * 2 + 0.09, 0.12, 0.07);
    const bandejaGeo = box(MEDIA_ANCHURA * 2 - 0.06, 0.035, MEDIA_PROF * 2 - 0.04);
    for (const y of NIVELES) {
      for (const z of [-MEDIA_PROF, MEDIA_PROF]) {
        const larguero = new three.Mesh(largueroGeo, matCobre);
        larguero.position.set(0, y, z);
        estante.add(larguero);
      }
      const bandeja = new three.Mesh(bandejaGeo, matRoca);
      bandeja.position.set(0, y + 0.077, 0);
      estante.add(bandeja);
    }
    const nivelY = (i: number) => NIVELES[i] + 0.095;

    // Sombra suave bajo el estante.
    const shadowCanvas = document.createElement("canvas");
    shadowCanvas.width = shadowCanvas.height = 128;
    const shadowCtx = shadowCanvas.getContext("2d")!;
    const grad = shadowCtx.createRadialGradient(64, 64, 4, 64, 64, 64);
    grad.addColorStop(0, "rgba(0,0,0,0.5)");
    grad.addColorStop(1, "rgba(0,0,0,0)");
    shadowCtx.fillStyle = grad;
    shadowCtx.fillRect(0, 0, 128, 128);
    const shadowTexture = new three.CanvasTexture(shadowCanvas);
    textures.add(shadowTexture);
    const shadow = new three.Mesh(
      ownGeometry(new three.PlaneGeometry(5.4, 2.2)),
      ownMaterial(
        new three.MeshBasicMaterial({
          map: shadowTexture,
          transparent: true,
          depthWrite: false,
        })
      )
    );
    shadow.rotation.x = -Math.PI / 2;
    shadow.position.y = 0.002;
    scene.add(shadow);
    // Base del estante: piso apenas más claro que el fondo.
    const pisoMesh = new three.Mesh(
      ownGeometry(new three.PlaneGeometry(5.4, 2.2)),
      ownMaterial(
        new three.MeshStandardMaterial({ color: piso.color, roughness: 1 })
      )
    );
    pisoMesh.rotation.x = -Math.PI / 2;
    pisoMesh.position.y = 0;
    scene.add(pisoMesh);
    shadow.position.y = 0.004;

    // --- Insumos ---
    // Tambor de 200 L: cilindro con dos aros de refuerzo y tapa.
    const tamborBody = cylinder(TAMBOR_R, TAMBOR_R, TAMBOR_H);
    const tamborAro = ownGeometry(new three.TorusGeometry(TAMBOR_R + 0.005, 0.016, 8, 32));
    const tamborTapa = cylinder(TAMBOR_R - 0.02, TAMBOR_R - 0.02, 0.02);
    function crearTambor() {
      const g = new three.Group();
      g.add(new three.Mesh(tamborBody, matCobre));
      for (const y of [-0.15, 0.13]) {
        const aro = new three.Mesh(tamborAro, matOscuro);
        aro.rotation.x = Math.PI / 2;
        aro.position.y = y;
        g.add(aro);
      }
      const tapa = new three.Mesh(tamborTapa, matOscuro);
      tapa.position.y = TAMBOR_H / 2 + 0.005;
      g.add(tapa);
      return g;
    }

    // Casco de seguridad: media esfera achatada con ala y cresta.
    function crearCasco() {
      const g = new three.Group();
      const cupula = new three.Mesh(
        ownGeometry(
          new three.SphereGeometry(0.21, 24, 12, 0, Math.PI * 2, 0, Math.PI / 2)
        ),
        matSal
      );
      cupula.scale.y = 0.78;
      g.add(cupula);
      const ala = new three.Mesh(cylinder(0.27, 0.27, 0.025), matSal);
      ala.position.y = 0.012;
      g.add(ala);
      const cresta = new three.Mesh(box(0.045, 0.05, 0.3), matSal);
      cresta.position.y = 0.15;
      g.add(cresta);
      return g;
    }

    // Bolsa de reactivo: cuerpo de tela con cuello recogido.
    function crearBolsa() {
      const g = new three.Group();
      const cuerpo = new three.Mesh(box(0.5, 0.52, 0.42), matBruma);
      cuerpo.position.y = 0.26;
      g.add(cuerpo);
      const cuello = new three.Mesh(cylinder(0.09, 0.14, 0.12), matBruma);
      cuello.position.y = 0.57;
      g.add(cuello);
      const asaGeo = ownGeometry(new three.TorusGeometry(0.05, 0.012, 6, 12, Math.PI));
      for (const x of [-0.19, 0.19]) {
        for (const z of [-0.15, 0.15]) {
          const asa = new three.Mesh(asaGeo, matBruma);
          asa.position.set(x, 0.53, z);
          asa.rotation.z = -x * 1.4;
          g.add(asa);
        }
      }
      const etiqueta = new three.Mesh(
        ownGeometry(new three.PlaneGeometry(0.3, 0.18)),
        matSal
      );
      etiqueta.position.set(0, 0.28, 0.213);
      g.add(etiqueta);
      return g;
    }

    // Filtro de aire: cartucho con aletas radiales y tapas.
    function crearFiltro() {
      const g = new three.Group();
      const cuerpo = new three.Mesh(cylinder(0.15, 0.15, 0.42), matSal);
      g.add(cuerpo);
      const aletaGeo = box(0.02, 0.4, 0.05);
      for (let i = 0; i < 10; i++) {
        const a = (i / 10) * Math.PI * 2;
        const aleta = new three.Mesh(aletaGeo, matBruma);
        aleta.position.set(Math.cos(a) * 0.15, 0, Math.sin(a) * 0.15);
        aleta.rotation.y = -a;
        g.add(aleta);
      }
      for (const y of [-0.22, 0.22]) {
        const tapa = new three.Mesh(cylinder(0.17, 0.17, 0.04), matOscuro);
        tapa.position.y = y;
        g.add(tapa);
      }
      return g;
    }

    // Bidón de lubricante: cuerpo, pico y manija.
    function crearBidon() {
      const g = new three.Group();
      const cuerpo = new three.Mesh(box(0.26, 0.36, 0.15), matCobre);
      cuerpo.position.y = 0.18;
      g.add(cuerpo);
      const manija = new three.Mesh(box(0.18, 0.04, 0.05), matOscuro);
      manija.position.y = 0.39;
      g.add(manija);
      const pico = new three.Mesh(cylinder(0.03, 0.045, 0.09), matOscuro);
      pico.position.set(0.08, 0.4, 0);
      pico.rotation.z = -0.5;
      g.add(pico);
      return g;
    }

    // Caja de repuestos con cinta.
    function crearCaja() {
      const g = new three.Group();
      const cuerpo = new three.Mesh(box(0.42, 0.3, 0.34), matBruma);
      cuerpo.position.y = 0.15;
      g.add(cuerpo);
      const cinta = new three.Mesh(box(0.43, 0.305, 0.09), matOscuro);
      cinta.position.y = 0.15;
      g.add(cinta);
      return g;
    }

    // Nivel 0: los tambores son el insumo protagonista (stock que baja).
    const tambores: Three.Group[] = [];
    for (let i = 0; i < TAMBORES; i++) {
      const tambor = crearTambor();
      tambor.position.set(-1.02 + i * 0.68, nivelY(0) + TAMBOR_H / 2, 0);
      tambores.push(tambor);
      estante.add(tambor);
    }

    // Nivel 1: bolsas de reactivo, filtro y bidón (insumos de relleno).
    const bolsaA = crearBolsa();
    bolsaA.position.set(-0.95, nivelY(1), 0);
    estante.add(bolsaA);
    const bolsaB = crearBolsa();
    bolsaB.position.set(-0.32, nivelY(1), 0);
    bolsaB.rotation.y = 0.25;
    estante.add(bolsaB);
    const filtro = crearFiltro();
    filtro.position.set(0.62, nivelY(1) + 0.25, 0.05);
    estante.add(filtro);
    const bidon = crearBidon();
    bidon.position.set(1.15, nivelY(1), -0.08);
    bidon.rotation.y = -0.15;
    estante.add(bidon);

    // Nivel 2: casco y caja de repuestos.
    const casco = crearCasco();
    casco.position.set(-0.45, nivelY(2), 0.05);
    casco.rotation.y = 0.4;
    estante.add(casco);
    const caja = crearCaja();
    caja.position.set(0.45, nivelY(2), -0.05);
    caja.rotation.y = -0.12;
    estante.add(caja);

    // --- Columna de nivel con la marca del punto de reorden ---
    const gauge = new three.Group();
    gauge.position.set(1.42, nivelY(0), 0.36);
    estante.add(gauge);
    const placa = new three.Mesh(box(0.17, NIVEL_H + 0.08, 0.03), matOscuro);
    placa.position.y = NIVEL_H / 2;
    gauge.add(placa);
    const matNivelOk = ownMaterial(
      new three.MeshStandardMaterial({ color: claro.color, roughness: 0.6 })
    );
    const matNivelBajo = ownMaterial(
      new three.MeshStandardMaterial({
        color: senal.color,
        roughness: 0.5,
        emissive: senal.color,
        emissiveIntensity: 0.5,
      })
    );
    const fill = new three.Mesh(box(0.06, 1, 0.045), matNivelOk);
    fill.position.set(0, NIVEL_H / 2, 0.045);
    fill.scale.y = NIVEL_H;
    gauge.add(fill);
    const marca = new three.Mesh(box(0.22, 0.025, 0.05), matSenal);
    marca.position.set(0, NIVEL_H * PUNTO_REORDEN, 0.05);
    gauge.add(marca);

    // --- Balizamiento de alerta sobre la bandeja superior ---
    const baliza = new three.Group();
    baliza.position.set(1.42, nivelY(2) + 0.005, 0.3);
    estante.add(baliza);
    const base = new three.Mesh(cylinder(0.09, 0.11, 0.06), matOscuro);
    base.position.y = 0.03;
    baliza.add(base);
    const matDomo = ownMaterial(
      new three.MeshStandardMaterial({
        color: senal.color,
        emissive: senal.color,
        emissiveIntensity: 0.15,
        roughness: 0.35,
      })
    );
    const domo = new three.Mesh(
      ownGeometry(
        new three.SphereGeometry(0.085, 20, 12, 0, Math.PI * 2, 0, Math.PI / 2)
      ),
      matDomo
    );
    domo.position.y = 0.06;
    baliza.add(domo);
    const matHalo = ownMaterial(
      new three.MeshBasicMaterial({
        color: senal.color,
        transparent: true,
        opacity: 0,
        depthWrite: false,
      })
    );
    const halo = new three.Mesh(
      ownGeometry(new three.SphereGeometry(0.15, 16, 10)),
      matHalo
    );
    halo.position.y = 0.09;
    baliza.add(halo);

    // Franja de señalización bajo el nivel de los tambores cuando hay alerta.
    const matFranja = ownMaterial(
      new three.MeshBasicMaterial({
        color: senal.color,
        transparent: true,
        opacity: 0,
      })
    );
    const franja = new three.Mesh(
      box(MEDIA_ANCHURA * 2 - 0.1, 0.03, 0.02),
      matFranja
    );
    franja.position.set(0, NIVELES[0] + 0.062, MEDIA_PROF + 0.036);
    estante.add(franja);

    // --- Tarjeta del agente: recomendación dibujada en una textura canvas ---
    const cardCanvas = document.createElement("canvas");
    cardCanvas.width = 512;
    cardCanvas.height = 336;
    const cardCtx = cardCanvas.getContext("2d");
    if (!cardCtx) {
      dispose();
      return null;
    }
    cardCtx.fillStyle = panel.css;
    cardCtx.fillRect(0, 0, 512, 336);
    cardCtx.fillStyle = senal.css;
    cardCtx.fillRect(0, 0, 12, 336);
    cardCtx.textBaseline = "middle";
    cardCtx.fillStyle = textoSuave.css;
    cardCtx.font = "500 25px Arial, sans-serif";
    cardCtx.fillText("Agente Jumin", 40, 46);
    cardCtx.fillStyle = tinta.css;
    cardCtx.font = "700 42px Arial, sans-serif";
    cardCtx.fillText("Recomendación", 40, 100);
    cardCtx.font = "600 30px Arial, sans-serif";
    cardCtx.fillText("Comprar 6 tambores de 200 L", 40, 158);
    cardCtx.fillStyle = textoSuave.css;
    cardCtx.font = "500 26px Arial, sans-serif";
    cardCtx.fillText("Lubricantes del Norte · Jujuy", 40, 206);
    cardCtx.fillStyle = senal.css;
    cardCtx.fillRect(40, 242, 350, 56);
    cardCtx.fillStyle = tinta.css;
    cardCtx.font = "700 26px Arial, sans-serif";
    cardCtx.fillText("Trust score 92 · 4 días", 62, 272);
    const cardTexture = new three.CanvasTexture(cardCanvas);
    textures.add(cardTexture);
    cardTexture.colorSpace = three.SRGBColorSpace;
    cardTexture.anisotropy = Math.min(4, renderer.capabilities.getMaxAnisotropy());

    const matTarjeta = ownMaterial(
      new three.MeshBasicMaterial({
        map: cardTexture,
        transparent: true,
        opacity: 0,
        depthWrite: false,
      })
    );
    const matTarjetaFondo = ownMaterial(
      new three.MeshBasicMaterial({
        color: tinta.color,
        transparent: true,
        opacity: 0,
        depthWrite: false,
      })
    );
    const tarjeta = new three.Group();
    const tarjetaFondo = new three.Mesh(
      ownGeometry(new three.PlaneGeometry(1.16, 0.76)),
      matTarjetaFondo
    );
    tarjetaFondo.position.z = -0.008;
    tarjeta.add(tarjetaFondo);
    const tarjetaFrente = new three.Mesh(
      ownGeometry(new three.PlaneGeometry(1.1, 0.72)),
      matTarjeta
    );
    tarjeta.add(tarjetaFrente);
    const matConector = ownMaterial(
      new three.MeshBasicMaterial({
        color: senal.color,
        transparent: true,
        opacity: 0,
      })
    );
    const TARJETA_X = 1.55;
    tarjeta.position.set(TARJETA_X, 1.58, 0.85);
    tarjeta.rotation.y = -0.38;
    scene.add(tarjeta);

    // Línea fina que une la recomendación con la alerta que la originó.
    const desde = new three.Vector3(1.42, nivelY(0) + NIVEL_H + 0.05, 0.36);
    const hasta = new three.Vector3(1.02, 1.28, 0.9);
    const dirConector = hasta.clone().sub(desde);
    const conector = new three.Mesh(
      cylinder(0.014, 0.014, dirConector.length(), 8),
      matConector
    );
    conector.position.copy(desde.clone().add(hasta).multiplyScalar(0.5));
    conector.quaternion.setFromUnitVectors(
      new three.Vector3(0, 1, 0),
      dirConector.normalize()
    );
    scene.add(conector);

    camera.position.set(2.85, 2.15, 5.0);
    camera.lookAt(0.15, 1.25, 0);

    function nivelEn(fase: number) {
      if (fase < T_DRENA_INI) return 1;
      if (fase < T_DRENA_FIN)
        return 1 - (1 - NIVEL_FINAL) * ease((fase - T_DRENA_INI) / (T_DRENA_FIN - T_DRENA_INI));
      if (fase < T_REPONE_INI) return NIVEL_FINAL;
      if (fase < T_REPONE_FIN)
        return NIVEL_FINAL + (1 - NIVEL_FINAL) * ease((fase - T_REPONE_INI) / (T_REPONE_FIN - T_REPONE_INI));
      return 1;
    }

    return {
      resize() {
        const { width, height } = host.getBoundingClientRect();
        if (!width || !height) return;
        renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 1.5));
        renderer.setSize(width, height, false);
        camera.aspect = width / height;
        // En pantallas angostas la cámara se aleja para que entre la tarjeta.
        camera.position
          .set(2.85, 2.15, 5.0)
          .multiplyScalar(Math.max(1, 1.2 / camera.aspect));
        camera.lookAt(0.15, 1.25, 0);
        camera.updateProjectionMatrix();
      },
      pose(tiempo) {
        const fase = tiempo % DURACION_CICLO;
        const nivel = nivelEn(fase);
        const alerta = nivel < PUNTO_REORDEN && fase < T_ALERTA_FIN;

        // Los tambores se van de derecha a izquierda siguiendo el nivel;
        // cada uno se aplasta rápido al cruzar su tramo, no queda a medias.
        for (let i = 1; i < TAMBORES; i++) {
          const visible = clamp01((nivel - i / TAMBORES) / 0.08);
          const tambor = tambores[i];
          tambor.visible = visible > 0.02;
          tambor.scale.y = 0.15 + 0.85 * ease(visible);
          tambor.position.y =
            nivelY(0) + (TAMBOR_H / 2) * tambor.scale.y;
        }

        fill.scale.y = Math.max(0.02, nivel * NIVEL_H);
        fill.position.y = fill.scale.y / 2;
        fill.material = nivel < PUNTO_REORDEN ? matNivelBajo : matNivelOk;

        const pulso = alerta ? 0.5 + 0.5 * Math.sin(fase * 7) : 0;
        marca.scale.setScalar(alerta ? 1.2 + pulso * 0.15 : 1);
        matDomo.emissiveIntensity = alerta ? 0.9 + pulso * 1.4 : 0.15;
        matHalo.opacity = alerta ? 0.16 + pulso * 0.2 : 0;
        halo.scale.setScalar(1 + pulso * 0.25);
        matFranja.opacity = alerta ? 0.35 + pulso * 0.3 : 0;

        const entrada = ease(
          clamp01((fase - T_TARJETA_INI) / T_TARJETA_DUR)
        );
        const salida = ease(
          clamp01((fase - T_TARJETA_FIN) / 0.6)
        );
        const apertura = entrada * (1 - salida);
        tarjeta.visible = apertura > 0.01;
        tarjeta.position.x = TARJETA_X + (1 - entrada) * 0.8;
        tarjeta.position.y = 1.58 - salida * 0.5;
        tarjeta.rotation.y = -0.38 - (1 - entrada) * 0.45;
        matTarjeta.opacity = apertura;
        matTarjetaFondo.opacity = apertura * 0.9;
        matConector.opacity = apertura * 0.85;

        // Vaivén mínimo para que la pieza se lea como volumen, no como lámina.
        estante.rotation.y = Math.sin(fase * 0.45) * 0.025;
      },
      render() {
        if (context.isContextLost()) return false;
        renderer.render(scene, camera);
        return !context.isContextLost();
      },
      dispose,
    };
  } catch (error) {
    dispose();
    throw error;
  }
}
