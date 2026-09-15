# supply_chain.sof_documents

## Por que existe
Vista analitica agregada de todos los documentos SOF procesados, para
reporting y dashboards - no es la fuente transaccional (esa es
`laytime_events` en Postgres).

## Dueno
Equipo Supply Chain

## Quien la consume
- Dashboards de BI
- extract-pdf-documents (Cloud Function que la puebla via Vertex AI)

## Campos

| Campo | Tipo | Notas |
|---|---|---|
| document_id | STRING | identificador del documento SOF |
| vessel / port | STRING | metadata del documento |
| allowed_laytime_hours | FLOAT64 | limite pactado |
| processed_at | TIMESTAMP | usado como particion |
| status | STRING | estado del procesamiento |

## Schema relacionado
- `bigquery/schemas/supply_chain/sof_documents.sql`
