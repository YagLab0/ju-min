// Proxy de Next 16 (convención nueva que reemplaza al viejo middleware.ts):
// corre por request antes de resolver la ruta. Acá se exige sesión para las
// áreas internas del demo y se redirige al panel a quien ya entró.

import { NextResponse, type NextRequest } from "next/server";

import { NOMBRE_COOKIE_SESION, verificarSello } from "@/lib/auth/sello";

const RUTAS_PROTEGIDAS = [
  /^\/panel(?:\/|$)/,
  /^\/proveedores(?:\/|$)/,
  /^\/informes(?:\/|$)/,
];

export async function proxy(request: NextRequest) {
  const { pathname, search } = request.nextUrl;
  const sesion = await verificarSello(
    request.cookies.get(NOMBRE_COOKIE_SESION)?.value,
  );

  if (pathname === "/login") {
    return sesion
      ? NextResponse.redirect(new URL("/panel", request.url))
      : NextResponse.next();
  }

  const protegida = RUTAS_PROTEGIDAS.some((re) => re.test(pathname));
  if (protegida && !sesion) {
    const url = new URL("/login", request.url);
    url.searchParams.set("desde", `${pathname}${search}`);
    return NextResponse.redirect(url);
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/panel/:path*", "/proveedores/:path*", "/informes/:path*", "/login"],
};
