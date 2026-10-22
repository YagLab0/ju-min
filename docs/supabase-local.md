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

Si para la demo alcanza con Postgres pelado (sin Auth/Realtime/Studio), un
`docker-compose.yml` chico con la imagen oficial de Supabase:

```yaml
# docker-compose.yml — propuesta, no implementado
services:
  db:
    image: supabase/postgres:17.4.1.043
    container_name: ju-min-db
    restart: unless-stopped
    ports:
      - "54322:5432"
    environment:
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
    volumes:
      - db-data:/var/lib/postgresql/data
      - ./supabase/migrations:/docker-entrypoint-initdb.d/migrations:ro
      - ./supabase/seed.sql:/docker-entrypoint-initdb.d/z-seed.sql:ro
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "postgres"]
      interval: 5s
      timeout: 5s
      retries: 10

volumes:
  db-data:
```

`docker compose up -d` y `DATABASE_URL=postgresql://postgres:postgres@localhost:54322/postgres`.
En este caso el acceso desde Next.js sería vía `postgres.js`/`drizzle`/`prisma`
en vez del cliente Supabase — **trade-off**: menos servicios, pero se pierde
Storage para los documentos y Studio para inspección visual.

### Recomendación

**Opción A**. Storage resuelve el requisito de evidencia documental ([schema-base-de-datos.md](schema-base-de-datos.md) §4.1),
Studio da un admin gratis para cargar datos durante el hackathon, y el mismo
`supabase/migrations` sirve después contra Supabase cloud. La Opción B queda
documentada como fallback por si Docker tiene pocos recursos.

---

