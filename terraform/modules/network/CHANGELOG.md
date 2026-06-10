# Changelog - Network Module

Todos los cambios notables del modulo de redes seran documentados en este archivo.

## [v1.0.2] - 2026-06-04

### Changed

- Se documento en el README del modulo que los ejemplos no versionan `.terraform.lock.hcl`.
- Se removio el lock file del ejemplo basico para cumplir la politica de archivos ignorados del repositorio.

## [v1.0.1] - 2026-06-04

### Fixed

- Se ajusto el ejemplo basico para usar `flow_log_retention_in_days = 365` y cumplir `CKV_AWS_338`.
- Se agrego justificacion Checkov para `CKV2_AWS_5`, porque el Security Group se exporta desde el modulo de red y se adjunta desde el root module mediante el modulo de computo.

## [v1.0.0] - 2026-06-04

### Added

- Version inicial estable del modulo de redes.
- Creacion parametrizada de VPC, subnet, Internet Gateway, Route Table y Security Group.
- Creacion de VPC Flow Logs con CloudWatch Log Group cifrado con KMS.
- Variables documentadas para nombre de proyecto, CIDR, zona de disponibilidad, SSH permitido, asignacion de IP publica y retencion de logs.
- Outputs `vpc_id`, `subnet_id`, `subnet_ids` y `security_group_id`.
- Ejemplo basico de uso en `examples/basic`.
