# Supabase local con Docker

Parte de la documentación de ju-min — índice en [DOCS.md](DOCS.md).


### Opción A (recomendada): Supabase CLI

La CLI de Supabase levanta el stack completo local **vía Docker Compose por
debajo** (Postgres + PostgREST + GoTrue auth + Realtime + Storage + Studio +
Inbucket para mail). Es la forma oficial y la que menos fricción da:

```bash
pnpm add supabase --save-dev --allow-build=supabase   # pnpm ≥10 requiere el flag
pnpm supabase init          # crea supabase/config.toml
pnpm supabase start         # levanta el stack (requiere Docker corriendo)
pnpm supabase status        # muestra URL, anon key, service key, Studio
```

Resultado:

| Servicio | Puerto |
|---|---|
| API (PostgREST/Kong) | `http://localhost:54321` |
| Postgres directo | `postgresql://postgres:postgres@localhost:54322/postgres` |
| Studio (dashboard) | `http://localhost:54323` |
| Inbucket (mail mock) | `http://localhost:54324` |

Las migraciones viven en `supabase/migrations/*.sql` (el DDL de [schema-base-de-datos.md](schema-base-de-datos.md) §4.3 se parte
en migraciones), y `supabase/seed.sql` puebla la demo con datos de las fuentes
Tier 1. El schema versionado es lo que luego se despliega idéntico a Supabase
cloud.

En Next.js:

```bash
pnpm add @supabase/supabase-js
```

```env
# .env.local
NEXT_PUBLIC_SUPABASE_URL=http://localhost:54321
NEXT_PUBLIC_SUPABASE_ANON_KEY=<anon key de `supabase status`>
SUPABASE_SERVICE_ROLE_KEY=<service key, solo server-side>
DATABASE_URL=postgresql://postgres:postgres@localhost:54322/postgres
```

### Opción B: docker-compose mínimo (solo Postgres)

Si para la demo alcanza con Postgres pelado (sin Auth/Realtime/Studio), el
`docker-compose.yml` de la raíz levanta **un solo contenedor** (`ju-min-db`)
con la misma imagen `supabase/postgres` que usa la CLI — necesaria porque el
schema referencia `auth.users` y `storage.buckets`, que esa imagen ya trae.

#### Crear el contenedor y poblar la base

```bash
docker compose up -d
```

El primer arranque hace todo solo — corre `scripts/db-init.sh` desde
`/docker-entrypoint-initdb.d`, que aplica en orden:

1. `supabase/migrations/*.sql` (el schema versionado, igual que la CLI)
2. `supabase/seed.sql` + `supabase/seed-data/*.sql` (mismo orden que
   `[db.seed].sql_paths` en `supabase/config.toml`)

Antes de eso el script crea a mano las piezas que en el stack completo
levantan los servicios y acá no existen: `storage.buckets`/`storage.objects`
(Storage-API), `auth.identities` y las columnas nuevas de `auth.users`
(GoTrue). Todo corre como `supabase_admin`.

> **Puerto ocupado**: el stack de la CLI también usa `54322`. Para correr
> las dos cosas a la vez: `DB_PORT=54330 docker compose up -d`
> (y `DATABASE_URL=...localhost:54330/postgres`).

#### Verificar que quedó poblada

```bash
docker exec ju-min-db psql -U postgres -c '\dt public.*'        # tablas
docker exec ju-min-db psql -U postgres -c 'select count(*) from proveedores'  # ~277
docker logs ju-min-db | grep 'ju-min init'                      # qué corrió
```

#### Resetear y resembrar

El init solo corre en el primer arranque del volumen. Para volver a correr
migraciones + seed desde cero:

```bash
docker compose down -v   # borra el volumen db-data
docker compose up -d     # recrea, migra y siembra
```

Conexión directa: `DATABASE_URL=postgresql://postgres:postgres@localhost:54322/postgres`,
o `docker exec -it ju-min-db psql -U postgres`.

**Trade-off**: sin PostgREST/GoTrue/Storage-API/Studio, la app **no** puede
usar esta base como fuente de datos (`AdaptadorSupabase` habla con la API de
Supabase, no con Postgres directo). Sirve para inspeccionar el schema y el
seed con psql, o para conectar un cliente propio vía
`postgres.js`/`drizzle`/`prisma`. Para la app hay que usar la Opción A.

### Recomendación

**Opción A**. Storage resuelve el requisito de evidencia documental ([schema-base-de-datos.md](schema-base-de-datos.md) §4.1),
Studio da un admin gratis para cargar datos durante el hackathon, y el mismo
`supabase/migrations` sirve después contra Supabase cloud. La Opción B queda
documentada como fallback por si Docker tiene pocos recursos.

---

## Compartir la BD local en la red (LAN)

Los contenedores del stack local ya escuchan en `0.0.0.0`, así que cualquier
máquina **en la misma red** puede usar la instancia sin configuración extra.

| Servicio | URL para compañeros |
|---|---|
| API (PostgREST, Auth, Storage, Realtime) | `http://10.136.190.59:54321` |
| Postgres directo | `postgresql://postgres:postgres@10.136.190.59:54322/postgres` |
| Studio (dashboard) | `http://10.136.190.59:54323` |
| Mailpit (mail mock) | `http://10.136.190.59:54324` |

> La IP `10.136.190.59` es la del host actual (`samas-pc`, WiFi `wlo1`) — era 192.168.1.79 en la red anterior. Si el
> host cambia de red o reinicia DHCP puede cambiar — verificar con `ip -4 addr`.

`.env.local` que debe usar cada compañero (las keys son las del stack local —
igual sale de `pnpm supabase status` y son idénticas en todas las máquinas):

```env
NEXT_PUBLIC_SUPABASE_URL=http://10.136.190.59:54321
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU
DATABASE_URL=postgresql://postgres:postgres@10.136.190.59:54322/postgres
```

Caveats:

- **Solo LAN**: fuera de la red local no funciona. Para acceso remoto usar una
  VPN tipo Tailscale/WireGuard o un túnel (`cloudflared tunnel`/`ngrok http
  54321`) — no abrir los puertos al router directamente.
- **RLS con anon key**: los compañeros usando la anon key solo ven proveedores
  `validado`/`auditado`/`homologado`. Para escribir o ver todo necesitan la
  service role key (compartirla solo si es de confianza — ignora RLS).
- **Datos compartidos**: todos editan la misma BD del host. Si alguien corre
  `pnpm supabase db reset` en su máquina solo resetea su propio stack, no este.

---

