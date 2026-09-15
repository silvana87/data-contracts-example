# users

## Por que existe
Representa a los usuarios autenticados via Auth0 + AzureAD que acceden
a los sistemas de CMPC.

## Dueno
Equipo Platform

## Quien la consume
- ms-auth
- app-shell (via ms-auth)

## Campos

| Campo | Tipo | Notas |
|---|---|---|
| id | bigserial | PK interno |
| external_id | text | id del proveedor de identidad (Auth0/AzureAD), unico |
| email | text | unico |
| display_name | text | nombre a mostrar |
| created_at / updated_at | timestamptz | auditoria, UTC |

## Migraciones relacionadas
- `postgres/migrations/auth/V1__init_users.sql`
