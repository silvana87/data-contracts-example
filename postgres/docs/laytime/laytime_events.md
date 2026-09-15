# laytime_events

## Por que existe
Almacena cada evento individual (arrival, nor_tendered, loading_start,
loading_end, departure) de un documento SOF, para poder recalcular el
laytime y auditar el historial completo.

## Dueno
Equipo Laytime

## Quien la consume
- ms-laytime (calculo de laytime)
- extract-pdf-documents (Cloud Function que la puebla)

## Campos

| Campo | Tipo | Notas |
|---|---|---|
| id | bigserial | PK |
| document_id | text | referencia al documento SOF (no es FK formal - el documento vive en BigQuery) |
| vessel | text | nombre de la nave |
| port | text | puerto del evento |
| event_type | text | uno de: arrival, nor_tendered, loading_start, loading_end, departure |
| event_timestamp | timestamptz | hora del evento segun el documento, no de ingesta |
| created_at / updated_at | timestamptz | auditoria, UTC |

## Migraciones relacionadas
- `postgres/migrations/laytime/V1__init_laytime_events.sql`
