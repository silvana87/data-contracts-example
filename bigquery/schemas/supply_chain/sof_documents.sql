-- Tabla: supply_chain.sof_documents
-- Dueno: equipo Supply Chain
-- Proyecto GCP: cmpc-cl-supply-chain-dev

CREATE TABLE IF NOT EXISTS `supply_chain.sof_documents` (
  document_id            STRING NOT NULL,
  vessel                 STRING NOT NULL,
  port                   STRING NOT NULL,
  allowed_laytime_hours  FLOAT64,
  processed_at           TIMESTAMP,
  status                 STRING
)
PARTITION BY DATE(processed_at)
OPTIONS (
  description = "Documentos SOF procesados, uno por fila, para analitica agregada de supply chain"
);
