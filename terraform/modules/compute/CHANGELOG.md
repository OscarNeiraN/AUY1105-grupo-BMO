# Changelog - Compute Module

Todos los cambios notables del modulo de computo seran documentados en este archivo.

## [v1.0.1] - 2026-06-04

### Changed

- Se documento en el README del modulo que los ejemplos no versionan `.terraform.lock.hcl`.
- Se removio el lock file del ejemplo basico para cumplir la politica de archivos ignorados del repositorio.

## [v1.0.0] - 2026-06-04

### Added

- Version inicial estable del modulo de computo.
- Creacion parametrizada de IAM Role, IAM Instance Profile e instancia EC2.
- Variables documentadas para AMI, tipo de instancia, subnet, security group, monitoreo, optimizacion EBS y cifrado del volumen raiz.
- Configuracion de IMDSv2 requerido.
- Outputs `instance_id`, `instance_ip`, `ec2_instance_id` y `ec2_public_ip`.
- Ejemplo basico de uso en `examples/basic`.
