# Changelog - Network Module

Todos los cambios notables del modulo de redes seran documentados en este archivo.

## [v1.0.0] - 2026-06-04

### Added

- Version inicial estable del modulo de redes.
- Creacion parametrizada de VPC, subnet, Internet Gateway, Route Table y Security Group.
- Creacion de VPC Flow Logs con CloudWatch Log Group cifrado con KMS.
- Variables documentadas para nombre de proyecto, CIDR, zona de disponibilidad, SSH permitido, asignacion de IP publica y retencion de logs.
- Outputs `vpc_id`, `subnet_id`, `subnet_ids` y `security_group_id`.
- Ejemplo basico de uso en `examples/basic`.
