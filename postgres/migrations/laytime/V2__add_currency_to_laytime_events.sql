-- V2__add_currency_to_laytime_events.sql
-- Dominio: laytime
-- Dueno: equipo Laytime (ver CODEOWNERS)
-- Cambio: agrega la columna currency a laytime_events

ALTER TABLE laytime_events
    ADD COLUMN IF NOT EXISTS currency TEXT;
