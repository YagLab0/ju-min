# Scraper CAPMIN — regenerar el seed de proveedores

Parte de la documentación de ju-min — índice en [DOCS.md](DOCS.md).

`scripts/scrape-capmin.ts` extrae los proveedores del **directorio público de
CAPMIN** (Cámara Argentina de Proveedores Mineros) y genera los INSERTs que
pueblan la BD local con datos reales.

## Instructivo de regeneración

```bash
# 1. Scrapear el directorio (requiere internet; ~8 páginas, ~10 s)
node scripts/scrape-capmin.ts

# 2. Reaplicar migraciones + seeds
./node_modules/.bin/supabase db reset
# (o `pnpm supabase db reset` si el registry npm responde —
#  ver docs/troubleshooting-red.md)
```

No hace falta `pnpm install` ni dependencias extra: Node 24 corre el `.ts`
directo y el script solo usa `fetch` + `node:fs`.

## Qué genera

| Archivo | Contenido | ¿Se commitea? |
|---|---|---|
| `supabase/seed-data/capmin.csv` | Dataset crudo: nombre, domicilio, localidad, provincia, web, rating, reviews, categorías, URL de detalle | Sí (auditable) |
| `supabase/seed-data/proveedores-capmin.sql` | INSERTs idempotentes para seed | Sí — el `db reset` de compañeros no necesita internet |

Orden de seeds en `supabase/config.toml` → `[db.seed] sql_paths`:

```
./seed.sql                          → catálogos + 20 proveedores curados + usuarios
./seed-data/proveedores-capmin.sql  → scrapeado (este script)
./seed-data/zz-trust-score.sql      → trust score calculado al final
```

## Qué extrae por proveedor

Del HTML de cada tarjeta (plugin Directorist de WordPress):

- `razon_social` — `h2.directorist-listing-title`
- `domicilio`, `localidad`, `provincia` — parseado de la dirección (último
  token = provincia si matchea lista de provincias AR)
- `sitio_web` — link externo de la tarjeta
- `categorias[]` — slugs de `/categoria-unica/<slug>/` (primera visible + popup)
- `rating`, `reviews` — rating del directorio
- `fuente='capmin'`, `fuente_url` — URL de la ficha de detalle

## Reglas del SQL generado ("cumplen requisitos")

- **Dedup**: `where not exists` por `upper(razon_social)` — no pisa los 20
  curados ni duplica en re-runs.
- **Categorías**: inserta las ~183 categorías CAPMIN que no existan ya (dedup
  por `slug` **y** `nombre`, ambos unique).
- **Estado**: `'validado'` si alguna de sus categorías tiene requisitos
  obligatorios en `requisitos_categoria` (→ visible con anon key por RLS),
  si no `'registrado'` (queda fuera de la red verificada).
- **Certificaciones sintetizadas**: para cada requisito **obligatorio** de sus
  categorías inserta una `proveedor_certificaciones` con `estado='verificado'`,
  organismo 'IRAM', vigencia 2024→2027 → `cumple_requisitos()` devuelve `true`.
  Es evidencia simulada — la real la pediría la minera en homologación.

## Limitaciones conocidas

- El directorio **no publica** CUIT, certificados reales, emails ni teléfonos —
  quedan null o sintéticos. El Registro de Jujuy (JS-rendered) no se scrapea.
- Si CAPMIN cambia el markup (clases `directorist-*`), el script devuelve 0
  tarjetas — revisar `parseCard`.
- El script es cortés: 400 ms entre páginas, User-Agent identificado. No correr
  en loop.

## Verificación post-reset

```bash
docker exec supabase_db_ju-min psql -U postgres -c "
  select estado, count(*) from proveedores group by 1;
  select fuente, count(*) from proveedores group by 1;"
# esperado: ~277 totales, ~46 validado/auditado/homologado
```
