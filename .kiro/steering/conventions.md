---
inclusion: always
---

# Convenciones de modelado y migraciones

## Postgres
- Migraciones versionadas estilo Flyway: `V{numero}__{descripcion_snake_case}.sql`
- Una migracion = un cambio logico (no mezclar creacion de tabla con
  cambios no relacionados)
- Nunca editar una migracion ya mergeada - cualquier cambio posterior
  va en una migracion nueva
- Nombres de tabla en snake_case, plural (`laytime_events`, no
  `LaytimeEvent`)
- Toda tabla nueva necesita su documento correspondiente en
  `postgres/docs/<dominio>/`

## BigQuery
- Un archivo `.sql` por tabla/vista en `bigquery/schemas/<dataset>/`
- Nombres de dataset y tabla en snake_case
- Las vistas van separadas de las tablas base, en
  `bigquery/schemas/<dataset>/views/`

## Documentacion (postgres/docs/, bigquery/docs/)
Cada entidad tiene un `.md` con:
- Por que existe (contexto de negocio)
- Quien es el dueno (equipo)
- Que componentes la consumen
- Campos sensibles o con reglas especiales

## Nombres de columnas
- snake_case
- Claves primarias: `id`
- Claves foraneas: `<entidad_singular>_id`
- Timestamps: `created_at`, `updated_at` (siempre en UTC)
