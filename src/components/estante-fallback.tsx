import Image from "next/image";
import almacen from "../../public/almacen-minero.webp";

/** Render del propio modelo, visible durante la carga o cuando no hay WebGL. */
export function EstanteFallback({ className }: { className?: string }) {
  return (
    <Image
      src={almacen}
      alt=""
      className={className}
      fill
      unoptimized
      loading="eager"
    />
  );
}
