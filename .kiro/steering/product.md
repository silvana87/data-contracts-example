---
inclusion: always
---

# Producto - cmpc-data-contracts

Repositorio central del modelo de datos compartido entre los proyectos
de CMPC (via Zenta). Es la Capa 1 ("contrato declarado") del modelo de
datos compartido: fuente unica de verdad para el esquema de Postgres y
BigQuery que consumen multiples componentes (Cloud Functions,
microservicios, y futuros proyectos).

No contiene logica de aplicacion ni credenciales - solo definicion de
esquema (DDL), documentacion de cada entidad, y el proceso para
cambiarlo.

## Como lo consumen otros proyectos
Cada repo consumidor (ej. ms-laytime, extract-pdf-documents) referencia
este repositorio como git submodule y actualiza esa referencia de forma
deliberada cuando decide absorber un cambio - nunca automatico.

## Se complementa con la Capa 2
Este repo es el contrato *declarado*. Para verificar que la base real
coincide con lo declarado aca, los proyectos consumidores pueden
conectar un MCP de base de datos (Postgres/BigQuery) que consulta el
esquema real en runtime y detecta drift contra esto.
