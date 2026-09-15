# Como contribuir a cmpc-data-contracts

Este repo es la fuente unica de verdad del modelo de datos compartido
entre proyectos de CMPC. Cualquier cambio sigue el proceso de
Spec-Driven Development, no un PR directo sin contexto.

## Pasos

1. Abri un spec en `.kiro/specs/<nombre-del-cambio>/`
   (Requirements -> Design -> Tasks) describiendo el cambio y su
   impacto en los consumidores
2. Pedile aprobacion al dueno del dominio (ver `CODEOWNERS`) antes de
   escribir la migracion
3. Agrega la migracion (`postgres/migrations/<dominio>/`) o el esquema
   (`bigquery/schemas/<dataset>/`) siguiendo
   `.kiro/steering/conventions.md`
4. Agrega o actualiza la documentacion de la entidad en
   `postgres/docs/` o `bigquery/docs/`
5. Abri el PR referenciando el spec
6. Una vez mergeado, avisa a los equipos consumidores listados en el
   doc de la entidad - actualizar su submodule es decision de cada
   equipo, no automatico

## Probar migraciones de Postgres localmente

```
export DATABASE_URL="postgres://postgres:postgres@localhost:5432/postgres"
./scripts/apply-postgres-migrations.sh laytime
```

## Que NO hacer

- No editar una migracion ya mergeada
- No eliminar columnas en uso sin periodo de deprecacion
  (ver `.kiro/steering/governance.md`)
- No agregar logica de aplicacion ni credenciales a este repo
