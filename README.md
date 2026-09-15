# cmpc-data-contracts

Repositorio central del modelo de datos compartido de CMPC — la
"Capa 1: contrato declarado" del modelo de datos compartido entre
Cloud Functions, microservicios y futuros proyectos.

## Por que existe este repo

Varios componentes consumen el mismo modelo de datos (ej. una Cloud
Function y un microservicio leyendo la misma tabla). Sin una fuente
central, cada uno termina con su propia copia del esquema, que se
desincroniza con el tiempo. Este repo resuelve eso: es la unica fuente
de verdad declarada, versionada, con dueños explicitos por dominio.

Se complementa (no reemplaza) con la **Capa 2**: un MCP de base de
datos (Postgres/BigQuery) conectado en cada proyecto consumidor, para
que Kiro pueda consultar el esquema real en runtime y detectar drift
contra lo declarado aca.

## Estructura

```
.kiro/
  steering/               # convenciones + gobernanza (se cargan en cada sesion de Kiro)
  specs/                  # cambios al modelo pasan por spec, como cualquier feature
postgres/
  migrations/<dominio>/    # SQL versionado, estilo Flyway (V1__..., V2__...)
  docs/<dominio>/          # una entidad = un .md (por que existe, dueño, consumidores)
bigquery/
  schemas/<dataset>/       # DDL de tablas y vistas
  docs/<dataset>/          # documentacion por tabla
scripts/
  apply-postgres-migrations.sh
CODEOWNERS                 # dueño por dominio
CONTRIBUTING.md            # proceso de cambio (via spec)
CHANGELOG.md
```

Dominios incluidos como ejemplo: `laytime` y `auth` (Postgres),
`supply_chain` (BigQuery) — agregá los que correspondan a tus proyectos
reales siguiendo el mismo patrón.

## Como lo usa un proyecto consumidor

Agregalo como git submodule:

```
git submodule add https://github.com/cmpc/cmpc-data-contracts.git .kiro/steering/data-contracts
git submodule update --init
```

Al vivir dentro de `.kiro/steering/`, Kiro lo carga como contexto
automáticamente en ese proyecto (revisá el `inclusion` en el
frontmatter de cada `.md` si querés ajustar cuándo se carga).

Actualizar el submodule es una decision explicita del equipo
consumidor, nunca automática:

```
cd .kiro/steering/data-contracts
git pull origin main
cd ../../..
git add .kiro/steering/data-contracts
git commit -m "chore(data-contracts): actualiza referencia a ultimo esquema"
```

(el mensaje de commit de arriba sigue la convención de
`commits-cmpc` que armamos para el proyecto demo — mismo `scope`,
mismo formato)

## Aplicar migraciones de Postgres localmente

```
export DATABASE_URL="postgres://postgres:postgres@localhost:5432/postgres"
./scripts/apply-postgres-migrations.sh laytime
```

## Contribuir

Ver `CONTRIBUTING.md` — todo cambio pasa por un spec de Kiro en
`.kiro/specs/` y aprobación del dueño del dominio (`CODEOWNERS`), antes
de tocar una sola línea de SQL.
