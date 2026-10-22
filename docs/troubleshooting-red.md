# Troubleshooting de red — npm registry bloqueado

Parte de la documentación de ju-min — índice en [DOCS.md](DOCS.md).

En la red del hackathon (y posiblemente otras), `registry.npmjs.org` está
bloqueado: `pnpm install` se cuelga reintentando `tcp connect error:
Connection refused`. El resto de internet funciona (Google, GitHub).

## Síntomas

```
[WARN] GET https://registry.npmjs.org/<paquete> error (... Connection refused ...)
Will retry in 10s. 1 retries left.
```

## Diagnóstico rápido

```bash
curl -s -o /dev/null -w "%{http_code}" --connect-timeout 5 https://registry.npmjs.org/   # 000 = bloqueado
curl -s -o /dev/null -w "%{http_code}" --connect-timeout 5 https://registry.npmmirror.com/ # 200 = mirror OK
```

## Solución: mirror npmmirror

Instalar usando el mirror de Alibaba (los hashes del `pnpm-lock.yaml` verifican
la integridad igual que el registry oficial):

```bash
pnpm install --registry=https://registry.npmmirror.com
```

Para no repetir el flag en cada comando:

```bash
# solo este proyecto (commiteable — pero pensá si el equipo quiere el mirror en repo)
pnpm config set registry https://registry.npmmirror.com --location project

# o solo tu sesión de shell
export NPM_CONFIG_REGISTRY=https://registry.npmmirror.com
```

> Nota: el token de `~/.npmrc` está scoped a `//registry.npmjs.org/` — no se
> envía al mirror, es seguro.

**Después de instalar, el wrapper `pnpm supabase ...` también destraba** — la
CLI corre lockfile-check implícito; si sigue molestando, correr el binario
directo: `./node_modules/.bin/supabase db reset`.

## Google Fonts también está bloqueado

`fonts.googleapis.com` no responde, así que `next/font/google` (Saira) cae a
fallback fonts — warning, no error:

```
Failed to download Saira from Google Fonts. Using a fallback font instead.
```

Opciones si el diseño depende de la fuente real:

- **Self-host**: descargar los `.woff2` de Saira/Saira Semi Condensed (desde
  una red sin bloqueo o fonts.google.com via mirror) a `src/app/fonts/` y usar
  `next/font/local`.
- **Mirror**: `fonts.loli.net` / `fonts.googleapis.cn` sirven el mismo CSS —
  requiere cambiar el import de `next/font` por `<link>` en el layout.

## Otros servicios verificados en esta red

| Servicio | Estado |
|---|---|
| Google, GitHub, 1.1.1.1 | OK |
| registry.npmjs.org, registry.yarnpkg.com | bloqueado |
| registry.npmmirror.com | OK |
| Supabase local (127.0.0.1 / 192.168.1.79) | OK |
| Docker Hub / public.ecr.aws (imágenes Supabase) | OK (ya descargadas) |

## Si el pull de pnpm vuelve a fallar

El primer `pnpm <cualquier comando>` tras un `git pull` con cambios en el
lockfile re-verifica supply-chain policies contra el registry → mismo bloqueo.
Usar siempre el flag `--registry` o el binary directo hasta salir de esta red.
