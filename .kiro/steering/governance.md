---
inclusion: always
---

# Gobernanza del modelo de datos compartido

## Dueno del contrato
Cada dominio (laytime, auth, supply_chain) tiene un dueno responsable
de aprobar cambios a su esquema - ver CODEOWNERS en la raiz del repo.

## Proceso de cambio
Un cambio al modelo compartido es una feature, no un ajuste menor:

1. Abrir un spec en `.kiro/specs/` describiendo el cambio (que entidad,
   por que, que componentes se ven afectados)
2. El dueno del dominio revisa y aprueba el spec antes de escribir la
   migracion
3. La migracion/esquema se agrega en un PR separado, referenciando el
   spec (ver CONTRIBUTING.md)
4. Los proyectos consumidores actualizan su referencia al submodule de
   forma explicita cuando estan listos

## Compatibilidad hacia atras
- No eliminar ni renombrar columnas en uso sin un periodo de
  deprecacion: agregar la columna nueva, migrar a los consumidores,
  recien despues eliminar la vieja
- Cambios que rompen compatibilidad requieren aviso previo a todos los
  equipos consumidores listados en el doc de cada entidad
