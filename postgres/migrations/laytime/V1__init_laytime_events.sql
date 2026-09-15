-- V1__init_laytime_events.sql
-- Dominio: laytime
-- Dueno: equipo Laytime (ver CODEOWNERS)

CREATE TABLE IF NOT EXISTS laytime_events (
    id              BIGSERIAL PRIMARY KEY,
    document_id     TEXT NOT NULL,
    vessel          TEXT NOT NULL,
    port            TEXT NOT NULL,
    event_type      TEXT NOT NULL,
    event_timestamp TIMESTAMPTZ NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_laytime_events_document_id
    ON laytime_events (document_id);
