#!/usr/bin/env bash
# Aplica, en orden, las migraciones de un dominio contra la base
# indicada en DATABASE_URL.
#
# Uso:
#   DATABASE_URL="postgres://user:pass@host:5432/db" \
#     ./scripts/apply-postgres-migrations.sh laytime

set -euo pipefail

DOMAIN="${1:-}"
if [[ -z "$DOMAIN" ]]; then
  echo "Uso: $0 <dominio>  (ej. laytime, auth)"
  exit 1
fi

if [[ -z "${DATABASE_URL:-}" ]]; then
  echo "Falta la variable de entorno DATABASE_URL"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MIGRATIONS_DIR="${SCRIPT_DIR}/../postgres/migrations/${DOMAIN}"

if [[ ! -d "$MIGRATIONS_DIR" ]]; then
  echo "No existe el dominio: ${DOMAIN} (${MIGRATIONS_DIR})"
  exit 1
fi

shopt -s nullglob
FILES=("${MIGRATIONS_DIR}"/V*.sql)
shopt -u nullglob

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "No hay migraciones en ${MIGRATIONS_DIR}"
  exit 0
fi

IFS=$'\n' SORTED=($(sort -V <<<"${FILES[*]}")); unset IFS

for file in "${SORTED[@]}"; do
  echo "Aplicando: $(basename "$file")"
  psql "$DATABASE_URL" -f "$file"
done

echo "Listo: migraciones de '${DOMAIN}' aplicadas."
