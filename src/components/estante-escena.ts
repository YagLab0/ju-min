import type * as Three from "three";

export type EstanteScene = {
  resize: () => void;
  pose: (tiempo: number) => void;
  render: () => boolean;
  dispose: () => void;
};

export const DURACION_CICLO = 16;
/** Pose estática: stock bajo y recomendación pendiente de decisión humana. */
export const INSTANTE_ALERTA = 8.6;

const clamp01 = (value: number) => Math.max(0, Math.min(1, value));
const ease = (value: number) => value * value * (3 - 2 * value);

export function createEstanteScene(
  three: typeof Three,
  canvas: HTMLCanvasElement,
  host: HTMLDivElement
): EstanteScene | null {
  const context = canvas.getContext("webgl2", { alpha: true, antialias: true });
  if (!context) return null;

  const renderer = new three.WebGLRenderer({
    canvas, context, alpha: true, antialias: true, powerPreference: "low-power",
  });
  const geometries = new Set<Three.BufferGeometry>();
  const materials = new Set<Three.Material>();
  const textures = new Set<Three.Texture>();
  let environment: Three.WebGLRenderTarget | null = null;
  const geometry = <T extends Three.BufferGeometry>(value: T): T => {
    geometries.add(value);
    return value;
  };
  const material = <T extends Three.Material>(value: T): T => {
    materials.add(value);
    return value;
  };
  function dispose() {
    geometries.forEach((value) => value.dispose());
    materials.forEach((value) => value.dispose());
    textures.forEach((value) => value.dispose());
    environment?.dispose();
    renderer.dispose();
    renderer.forceContextLoss();
  }

  try {
    const computed = getComputedStyle(host);
    const css = (token: string) => computed.getPropertyValue(token).trim();
    const ink = new three.Color(css("--color-tinta"));
    const paper = new three.Color(css("--color-papel"));
    const white = new three.Color(css("--color-ficha"));
    const stone = new three.Color(css("--color-piedra"));
    const line = new three.Color(css("--color-linea"));
    const yellow = new three.Color(css("--color-senal"));
    const copper = new three.Color(css("--color-cobre"));
    const standard = (tint: Three.Color, roughness = 0.6, metalness = 0) =>
      material(new three.MeshStandardMaterial({ color: tint, roughness, metalness }));
    const ivory = standard(paper, 0.72);
    const steel = standard(stone.clone().lerp(ink, 0.5), 0.32, 0.72);
    const zinc = standard(line, 0.28, 0.78);
    const dark = standard(ink, 0.7, 0.12);
    const beam = standard(yellow, 0.32, 0.18);
    const bronze = standard(copper, 0.34, 0.55);
    const timber = standard(copper.clone().lerp(paper, 0.52), 0.88);
    const carton = standard(line.clone().lerp(copper, 0.14), 0.95);
    const ore = standard(stone, 0.95);
    const oreLight = standard(stone.clone().lerp(line, 0.24), 0.92);
    const boxCache = new Map<string, Three.BufferGeometry>();

    // Geometría biselada compartida: las aristas capturan los reflejos del estudio.
    function box(w: number, h: number, d: number, radius = 0.012) {
      const r = Math.min(radius, w / 4, h / 4, d / 4);
      const key = `${w},${h},${d},${r}`;
      const cached = boxCache.get(key);
      if (cached) return cached;
      const x = w / 2 - r / 2;
      const y = h / 2 - r / 2;
      const corner = r / 2;
      const shape = new three.Shape();
      shape.moveTo(-x + corner, -y);
      shape.lineTo(x - corner, -y);
      shape.quadraticCurveTo(x, -y, x, -y + corner);
      shape.lineTo(x, y - corner);
      shape.quadraticCurveTo(x, y, x - corner, y);
      shape.lineTo(-x + corner, y);
      shape.quadraticCurveTo(-x, y, -x, y - corner);
      shape.lineTo(-x, -y + corner);
      shape.quadraticCurveTo(-x, -y, -x + corner, -y);
      const result = geometry(new three.ExtrudeGeometry(shape, {
        depth: d - r, bevelEnabled: true, bevelSegments: 3,
        bevelSize: r / 2, bevelThickness: r / 2, steps: 1, curveSegments: 4,
      }));
      result.translate(0, 0, -d / 2 + r / 2);
      boxCache.set(key, result);
      return result;
    }
    const cylinder = (r: number, h: number, segments = 48) =>
      geometry(new three.CylinderGeometry(r, r, h, segments));
    function mesh(
      shape: Three.BufferGeometry, finish: Three.Material, parent: Three.Object3D,
      x = 0, y = 0, z = 0
    ) {
      const part = new three.Mesh(shape, finish);
      part.position.set(x, y, z);
      part.castShadow = true;
      part.receiveShadow = true;
      parent.add(part);
      return part;
    }
    const scene = new three.Scene();
    const camera = new three.OrthographicCamera(-3.35, 3.35, 2.5, -2.5, 0.1, 40);
    camera.position.set(5.6, 4.15, 8.5);
    camera.lookAt(0, 1.08, 0);
    renderer.setClearColor(paper, 0);
    renderer.outputColorSpace = three.SRGBColorSpace;
    renderer.toneMapping = three.ACESFilmicToneMapping;
    renderer.toneMappingExposure = 1.12;
    renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = three.PCFShadowMap;

    // Reflejos de softboxes precalculados una sola vez, sin HDR remoto ni postprocesado.
    const studio = new three.Scene();
    studio.background = paper.clone().multiplyScalar(0.55);
    const panelGeometry = geometry(new three.PlaneGeometry(1, 1));
    function softbox(x: number, y: number, z: number, w: number, h: number, intensity: number) {
      const panel = new three.Mesh(panelGeometry, material(new three.MeshBasicMaterial({
        color: white.clone().multiplyScalar(intensity), side: three.DoubleSide, toneMapped: false,
      })));
      panel.position.set(x, y, z);
      panel.scale.set(w, h, 1);
      panel.lookAt(0, 1, 0);
      studio.add(panel);
    }
    softbox(-4, 5, 4, 4, 6, 7);
    softbox(4, 3, 1, 2, 5, 4);
    softbox(0, 5, -4, 4, 2, 5);
    const generator = new three.PMREMGenerator(renderer);
    try {
      environment = generator.fromScene(studio, 0.04, 0.1, 30, { size: 128 });
      scene.environment = environment.texture;
      scene.environmentIntensity = 0.6;
    } finally {
      generator.dispose();
    }
    scene.add(new three.HemisphereLight(white, stone, 0.85));
    const keyLight = new three.DirectionalLight(white, 3.2);
    keyLight.position.set(-3.5, 7, 4.5);
    keyLight.castShadow = true;
    keyLight.shadow.mapSize.set(2048, 2048);
    Object.assign(keyLight.shadow.camera, { left: -3.8, right: 3.8, top: 3.8, bottom: -3.8, near: 0.5, far: 16 });
    keyLight.shadow.normalBias = 0.012;
    keyLight.shadow.bias = -0.0001;
    keyLight.shadow.radius = 3;
    keyLight.target.position.set(0, 0.7, 0);
    scene.add(keyLight, keyLight.target);
    const rim = new three.DirectionalLight(paper, 1.8);
    rim.position.set(3, 4, -3);
    scene.add(rim);

    const miniature = new three.Group();
    scene.add(miniature);
    mesh(box(5, 0.17, 3.05, 0.06), ivory, miniature, 0, -0.105);
    mesh(box(4.96, 0.025, 3.01, 0.04), zinc, miniature, 0, -0.2);
    // Juntas del pavimento y marcas de circulación, a escala de la plataforma.
    for (const x of [-1.65, 0, 1.65]) mesh(box(0.006, 0.002, 2.9), carton, miniature, x, -0.018);
    for (const z of [-0.5, 0.5]) mesh(box(4.85, 0.002, 0.006), carton, miniature, 0, -0.018, z);
    for (const x of [-2.25, 2.25]) mesh(box(0.025, 0.003, 2.5), beam, miniature, x, -0.016);

    const shadowCanvas = document.createElement("canvas");
    shadowCanvas.width = shadowCanvas.height = 256;
    const shadowContext = shadowCanvas.getContext("2d");
    if (!shadowContext) { dispose(); return null; }
    const gradient = shadowContext.createRadialGradient(128, 128, 20, 128, 128, 128);
    gradient.addColorStop(0, "rgba(41,36,28,0.28)");
    gradient.addColorStop(0.55, "rgba(41,36,28,0.12)");
    gradient.addColorStop(1, "rgba(41,36,28,0)");
    shadowContext.fillStyle = gradient;
    shadowContext.fillRect(0, 0, 256, 256);
    const shadowTexture = new three.CanvasTexture(shadowCanvas);
    textures.add(shadowTexture);
    const shadow = mesh(geometry(new three.PlaneGeometry(6.8, 4.7)),
      material(new three.MeshBasicMaterial({ map: shadowTexture, transparent: true, depthWrite: false })),
      scene, 0.1, -0.225, 0.1);
    shadow.rotation.x = -Math.PI / 2;
    shadow.castShadow = false;
    shadow.receiveShadow = false;

    // Etiquetas propias de alta resolución: texto, lote y código de barras, no texturas externas.
    function labelTexture(kind: "drum" | "crate") {
      const label = document.createElement("canvas");
      label.width = 512;
      label.height = 384;
      const ctx = label.getContext("2d");
      if (!ctx) throw new Error("No se pudo generar la etiqueta del insumo");
      ctx.fillStyle = css("--color-papel");
      ctx.fillRect(0, 0, 512, 384);
      ctx.fillStyle = css("--color-senal");
      ctx.fillRect(0, 0, 512, 62);
      ctx.fillStyle = css("--color-tinta");
      ctx.font = "bold 27px sans-serif";
      ctx.fillText("JUMIN / SUMINISTROS", 28, 41);
      ctx.font = "bold 43px sans-serif";
      ctx.fillText(kind === "drum" ? "LUBRICANTE" : "REPUESTOS", 28, 125);
      ctx.font = "25px sans-serif";
      ctx.fillText(kind === "drum" ? "ISO VG 46 · 200 L" : "USO INDUSTRIAL", 28, 167);
      ctx.strokeStyle = css("--color-linea");
      ctx.beginPath(); ctx.moveTo(28, 195); ctx.lineTo(484, 195); ctx.stroke();
      ctx.font = "19px monospace";
      ctx.fillText("ALM-01 / LOTE 0042", 28, 230);
      for (let i = 0; i < 65; i++) {
        const width = i % 4 === 0 ? 4 : i % 3 === 0 ? 2 : 1;
        ctx.fillRect(30 + i * 5, 260, width, 65);
      }
      ctx.font = "17px monospace";
      ctx.fillText("INSUMO DE DEMOSTRACIÓN", 28, 357);
      const texture = new three.CanvasTexture(label);
      texture.colorSpace = three.SRGBColorSpace;
      texture.anisotropy = Math.min(4, renderer.capabilities.getMaxAnisotropy());
      textures.add(texture);
      return texture;
    }
    const drumLabel = material(new three.MeshStandardMaterial({ map: labelTexture("drum"), roughness: 0.82 }));
    const crateLabel = material(new three.MeshStandardMaterial({ map: labelTexture("crate"), roughness: 0.9 }));
    const labelPlane = geometry(new three.PlaneGeometry(0.29, 0.22));
    const boltGeometry = cylinder(0.022, 0.018, 6);
    function bolt(parent: Three.Object3D, x: number, y: number, z: number) {
      const part = mesh(boltGeometry, zinc, parent, x, y, z);
      part.rotation.x = Math.PI / 2;
    }

    const rack = new three.Group();
    rack.position.set(-0.12, 0, -0.63);
    miniature.add(rack);
    const levels = [0.22, 1.24, 2.26];
    const postGeometry = box(0.11, 2.72, 0.1);
    const postReturn = box(0.055, 2.72, 0.015);
    const footGeometry = box(0.24, 0.035, 0.22);
    const holes = new three.InstancedMesh(box(0.026, 0.047, 0.004, 0.006), dark, 48);
    const matrix = new three.Matrix4();
    let holeIndex = 0;
    for (const x of [-1.52, 1.52]) {
      for (const z of [-0.48, 0.48]) {
        mesh(postGeometry, steel, rack, x, 1.36, z);
        mesh(postReturn, zinc, rack, x + 0.065, 1.36, z - 0.038);
        mesh(footGeometry, steel, rack, x, 0.015, z);
        for (let i = 0; i < 12; i++) {
          matrix.makeTranslation(x, 0.25 + i * 0.2, z + 0.052);
          holes.setMatrixAt(holeIndex++, matrix);
        }
        for (const dx of [-0.075, 0.075]) {
          const anchor = mesh(boltGeometry, zinc, rack, x + dx, 0.043, z + 0.06);
          anchor.rotation.y = Math.PI / 6;
        }
        // Protección de impacto en la base del montante.
        mesh(box(0.135, 0.28, 0.12), beam, rack, x, 0.19, z + 0.015);
      }
      for (const sign of [-1, 1]) {
        const brace = mesh(box(0.026, 1.48, 0.026), zinc, rack, x, 0.78, 0);
        brace.rotation.x = sign * 0.65;
      }
    }
    holes.instanceMatrix.needsUpdate = true;
    rack.add(holes);
    for (const y of levels) {
      mesh(box(3.02, 0.04, 0.96), zinc, rack, 0, y + 0.066);
      for (const z of [-0.5, 0.5]) {
        mesh(box(3.12, 0.14, 0.08), steel, rack, 0, y, z);
        mesh(box(3.09, 0.018, 0.012), beam, rack, 0, y + 0.045, z + 0.045);
        for (const x of [-1.42, 1.42]) {
          mesh(box(0.17, 0.2, 0.015), bronze, rack, x, y, z + 0.055);
          for (const dy of [-0.05, 0.05]) bolt(rack, x, y + dy, z + 0.07);
        }
      }
      for (const x of [-1.49, 1.49]) mesh(box(0.065, 0.13, 0.98), steel, rack, x, y);
      mesh(box(0.4, 0.08, 0.012), ivory, rack, -0.92, y - 0.005, 0.55);
      for (let i = 0; i < 12; i++) mesh(box(i % 3 === 0 ? 0.008 : 0.003, 0.035, 0.003), dark, rack, -1.05 + i * 0.018, y - 0.005, 0.558);
    }

    // Tambores de chapa embutida: perfil torneado, aros, tapas y etiquetas curvas.
    const profile: Three.Vector2[] = [];
    for (const [radius, height] of [
      [0.255, 0], [0.275, 0.014], [0.28, 0.033], [0.272, 0.05],
      [0.272, 0.19], [0.285, 0.205], [0.285, 0.225], [0.272, 0.24],
      [0.272, 0.54], [0.285, 0.555], [0.285, 0.575], [0.272, 0.59],
      [0.272, 0.735], [0.28, 0.75], [0.28, 0.77], [0.255, 0.785],
    ]) profile.push(new three.Vector2(radius, height));
    const drumBody = geometry(new three.LatheGeometry(profile, 64));
    const drumLid = cylinder(0.257, 0.012);
    const hoopGeometry = geometry(new three.TorusGeometry(0.275, 0.009, 8, 64));
    const labelCurve = geometry(new three.CylinderGeometry(0.274, 0.274, 0.3, 32, 1, true, -0.62, 1.24));
    function drum() {
      const group = new three.Group();
      mesh(drumBody, bronze, group);
      for (const y of [0.025, 0.215, 0.565, 0.76]) {
        const hoop = mesh(hoopGeometry, zinc, group, 0, y);
        hoop.rotation.x = Math.PI / 2;
      }
      mesh(drumLid, steel, group, 0, 0.78);
      mesh(drumLid, dark, group, 0, 0.007);
      mesh(cylinder(0.038, 0.018, 24), zinc, group, 0.13, 0.797, 0.06);
      mesh(cylinder(0.017, 0.02, 6), dark, group, -0.11, 0.798, -0.085);
      mesh(labelCurve, drumLabel, group, 0, 0.395);
      return group;
    }
    const drums: Three.Group[] = [];
    for (let i = 0; i < 4; i++) {
      const group = drum();
      group.position.set(-1.1 + i * 0.73, 0.31, 0);
      group.rotation.y = i % 2 === 0 ? -0.1 : 0.06;
      rack.add(group);
      drums.push(group);
    }

    function crate(width: number, height: number, depth: number) {
      const group = new three.Group();
      mesh(box(width, height, depth, 0.018), carton, group, 0, height / 2);
      // Junta de tapa, cantoneras y cinchas textiles; sin listones gruesos de juguete.
      mesh(box(width - 0.015, 0.004, 0.008), timber, group, 0, height + 0.002);
      for (const x of [-width * 0.31, width * 0.31]) {
        mesh(box(0.025, height + 0.008, depth + 0.008), dark, group, x, height / 2);
        mesh(box(0.028, 0.003, depth + 0.012), steel, group, x, height + 0.006);
      }
      mesh(labelPlane, crateLabel, group, 0, height * 0.52, depth / 2 + 0.006);
      return group;
    }
    for (let i = 0; i < 2; i++) {
      const group = crate(0.76, 0.59, 0.65);
      group.position.set(-0.92 + i * 0.91, 1.33, 0);
      rack.add(group);
    }
    const filterBody = cylinder(0.135, 0.51);
    const finGeometry = box(0.008, 0.46, 0.025, 0.002);
    for (const x of [0.77, 1.13]) {
      const filter = new three.Group();
      mesh(filterBody, ivory, filter, 0, 0.285);
      for (let i = 0; i < 32; i++) {
        const angle = i / 32 * Math.PI * 2;
        const fin = mesh(finGeometry, carton, filter, Math.sin(angle) * 0.14, 0.285, Math.cos(angle) * 0.14);
        fin.rotation.y = angle;
      }
      for (const y of [0.025, 0.545]) {
        mesh(cylinder(0.158, 0.035), zinc, filter, 0, y);
        mesh(cylinder(0.065, 0.04), dark, filter, 0, y + 0.01);
      }
      filter.position.set(x, 1.33, 0);
      rack.add(filter);
    }

    const domeGeometry = geometry(new three.SphereGeometry(0.265, 48, 24, 0, Math.PI * 2, 0, Math.PI / 2));
    const brimGeometry = cylinder(0.32, 0.024, 64);
    const helmetRib = geometry(new three.TorusGeometry(0.267, 0.012, 8, 48, Math.PI));
    function helmet() {
      const group = new three.Group();
      const dome = mesh(domeGeometry, beam, group, 0, 0.035);
      dome.scale.set(0.96, 0.83, 1.08);
      const brim = mesh(brimGeometry, beam, group, 0, 0.025, 0.025);
      brim.scale.set(0.95, 1, 1.17);
      const lining = mesh(cylinder(0.26, 0.018), dark, group, 0, 0.011);
      lining.scale.z = 1.09;
      const rib = mesh(helmetRib, beam, group, 0, 0.035);
      rib.rotation.y = Math.PI / 2;
      rib.scale.set(1.06, 0.84, 1);
      mesh(box(0.11, 0.045, 0.005), ivory, group, 0, 0.12, 0.267);
      for (const x of [-0.15, 0.15]) mesh(box(0.035, 0.012, 0.005), dark, group, x, 0.09, 0.22);
      return group;
    }
    for (const x of [-1, -0.24]) {
      const group = helmet();
      group.position.set(x, 2.35, 0);
      group.rotation.y = 0.12;
      rack.add(group);
    }
    const spare = crate(0.76, 0.39, 0.64);
    spare.position.set(0.8, 2.35, 0);
    rack.add(spare);

    // Jaula galvanizada y mineral irregular: malla fina, patines y carga con volumen.
    const freight = new three.Group();
    freight.position.set(1.12, 0, 0.87);
    freight.rotation.y = -0.12;
    miniature.add(freight);
    for (const z of [-0.32, 0.32]) mesh(box(1.22, 0.09, 0.14), timber, freight, 0, 0.045, z);
    for (let i = 0; i < 6; i++) mesh(box(0.17, 0.045, 0.91), timber, freight, -0.5 + i * 0.2, 0.112);
    for (const x of [-0.57, 0.57]) {
      for (const z of [-0.41, 0.41]) mesh(box(0.028, 0.57, 0.028), steel, freight, x, 0.42, z);
    }
    for (const y of [0.16, 0.69]) {
      for (const z of [-0.41, 0.41]) mesh(box(1.17, 0.025, 0.025), steel, freight, 0, y, z);
      for (const x of [-0.57, 0.57]) mesh(box(0.025, 0.025, 0.84), steel, freight, x, y);
    }
    const wireVertical = box(0.006, 0.5, 0.006, 0.001);
    const wireHorizontal = box(1.12, 0.006, 0.006, 0.001);
    for (const z of [-0.41, 0.41]) {
      for (let i = 1; i < 12; i++) mesh(wireVertical, zinc, freight, -0.57 + i * 0.095, 0.42, z);
      for (let i = 1; i < 5; i++) mesh(wireHorizontal, zinc, freight, 0, 0.16 + i * 0.106, z);
    }
    const rockGeometry = geometry(new three.IcosahedronGeometry(0.22, 1));
    const positions = rockGeometry.getAttribute("position");
    for (let i = 0; i < positions.count; i++) {
      const x = positions.getX(i), y = positions.getY(i), z = positions.getZ(i);
      const irregularity = 1 + 0.14 * Math.sin(x * 31 + z * 17) * Math.cos(y * 23);
      positions.setXYZ(i, x * irregularity, y * irregularity, z * irregularity);
    }
    rockGeometry.computeVertexNormals();
    const rocks = [
      [-0.34, 0.32, -0.18, 1.05], [0, 0.32, -0.2, 1.1], [0.34, 0.31, -0.17, 0.9],
      [-0.35, 0.31, 0.16, 0.9], [0, 0.33, 0.14, 1.15], [0.35, 0.3, 0.17, 0.85],
      [-0.17, 0.52, -0.04, 0.9], [0.18, 0.53, 0.02, 0.95], [0.01, 0.69, -0.06, 0.65],
    ];
    rocks.forEach(([x, y, z, scale], index) => {
      const rock = mesh(rockGeometry, index % 2 ? ore : oreLight, freight, x, y, z);
      rock.scale.set(scale, scale * 0.8, scale * 0.9);
      rock.rotation.set(index * 0.73, index * 1.2, index * 0.4);
    });
    const foregroundCrate = crate(0.85, 0.52, 0.68);
    foregroundCrate.position.set(-1.6, 0, 0.87);
    foregroundCrate.rotation.y = 0.1;
    miniature.add(foregroundCrate);
    const foregroundHelmet = helmet();
    foregroundHelmet.position.set(-1.6, 0.525, 0.87);
    foregroundHelmet.rotation.y = -0.35;
    miniature.add(foregroundHelmet);
    for (let i = 0; i < 3; i++) {
      const stripe = mesh(box(0.1, 0.003, 0.32), beam, miniature, -0.38 + i * 0.18, -0.016, 1.22);
      stripe.rotation.y = -0.5;
    }
    const beaconMaterial = material(new three.MeshStandardMaterial({ color: yellow, emissive: yellow, emissiveIntensity: 0.1, roughness: 0.25 }));
    mesh(cylinder(0.085, 0.04), steel, rack, 1.35, 2.37, 0.32);
    mesh(geometry(new three.SphereGeometry(0.075, 32, 16, 0, Math.PI * 2, 0, Math.PI / 2)), beaconMaterial, rack, 1.35, 2.39, 0.32);
    const gaugeMaterial = material(new three.MeshStandardMaterial({ color: yellow, emissive: yellow, emissiveIntensity: 0.1 }));
    mesh(box(0.1, 0.76, 0.025), dark, rack, 1.4, 0.72, 0.57);
    const gauge = mesh(box(0.035, 1, 0.028), gaugeMaterial, rack, 1.4, 0.72, 0.59);
    mesh(box(0.15, 0.014, 0.03), beam, rack, 1.4, 0.6, 0.61);
    let previousPhase = "";

    return {
      resize() {
        const { width, height } = canvas.getBoundingClientRect();
        if (!width || !height) return;
        // Sobremuestreo 2× incluso en pantallas 1×; nunca supera 1,6 megapíxeles.
        renderer.setPixelRatio(Math.min(2, Math.sqrt(1_600_000 / (width * height))));
        renderer.setSize(width, height, false);
        const aspect = width / height;
        const halfWidth = Math.max(3.04, 2.2 * aspect);
        camera.left = -halfWidth;
        camera.right = halfWidth;
        camera.top = halfWidth / aspect;
        camera.bottom = -halfWidth / aspect;
        camera.updateProjectionMatrix();
      },
      pose(time) {
        const phase = time % DURACION_CICLO;
        const draining = ease(clamp01((phase - 1.5) / 4));
        const replenishing = ease(clamp01((phase - 12.8) / 1.7));
        const level = 1 - 0.75 * draining * (1 - replenishing);
        const low = level < 0.4;
        const state = phase >= 12.8 ? "repuesto" : phase >= 10.8 ? "aprobado" : phase >= 7 ? "propuesta" : low ? "alerta" : "stock";
        if (state !== previousPhase) {
          host.dataset.phase = state;
          previousPhase = state;
        }
        host.style.setProperty("--stock-level", `${level * 100}%`);
        for (let i = 1; i < drums.length; i++) {
          const amount = ease(clamp01((level - i * 0.25) / 0.12));
          drums[i].visible = amount > 0.015;
          drums[i].scale.setScalar(0.92 + amount * 0.08);
          drums[i].position.y = 0.31 + (1 - amount) * 0.1;
        }
        gauge.scale.y = Math.max(0.025, level * 0.64);
        gauge.position.y = 0.39 + gauge.scale.y / 2;
        beaconMaterial.emissiveIntensity = low ? 0.6 + Math.sin(phase * 3) * 0.2 : 0.1;
        miniature.rotation.y = Math.sin(phase / DURACION_CICLO * Math.PI * 2) * 0.035;
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
