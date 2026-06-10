# Changelog

Todos los cambios notables de este proyecto seran documentados en este archivo.

## [2.0.2] - 2026-06-04

### Changed

- Se actualizo `.gitignore` para ignorar `**/.terraform.lock.hcl`.
- Se removieron del repositorio los lock files de Terraform del root module y de los ejemplos de modulos.
- Se documento en `README.md` que los `.terraform.lock.hcl` no se versionan y no deben mostrarse en GitHub.
- Se actualizo la documentacion de versionado para los tags `v2.0.2`, `network-v1.0.2` y `compute-v1.0.1`.

## [2.0.1] - 2026-06-04

### Fixed

- Se ajusto el ejemplo basico del modulo `network` para usar retencion de logs de 365 dias y cumplir `CKV_AWS_338`.
- Se documento una excepcion especifica de Checkov `CKV2_AWS_5` en el Security Group del modulo `network`, ya que el modulo exporta el recurso y el root module lo adjunta a EC2 mediante `compute`.

## [2.0.0] - 2026-06-04

### Added

- Se agrego estructura monorepo con modulos Terraform locales para redes y computo.
- Se agrego `terraform/modules/network` con `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`, `README.md`, `CHANGELOG.md`, `VERSION` y ejemplos.
- Se agrego `terraform/modules/compute` con `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`, `README.md`, `CHANGELOG.md`, `VERSION` y ejemplos.
- Se agrego `terraform/terraform.tfvars` con datos no sensibles de infraestructura.
- Se agrego `terraform/moved.tf` para conservar trazabilidad de estado al pasar recursos del root module a modulos.
- Se agregaron outputs `subnet_ids`, `instance_id` e `instance_ip` para cumplir los minimos de la pauta.
- Se agrego `terraform/versions.tf` para centralizar version requerida de Terraform y proveedor AWS.

### Changed

- `terraform/main.tf` ahora actua como controlador central y solo llama los modulos `network` y `compute`.
- `terraform/variables.tf` ya no contiene valores por defecto de infraestructura; los valores se entregan mediante `terraform.tfvars`.
- El workflow de TFLint ahora usa revision recursiva para incluir root module, modulos y ejemplos.
- Se actualizo `README.md` para documentar la Evaluacion Parcial 2, la estructura monorepo, los modulos y el versionado semantico.

### Security

- Se mantiene IMDSv2 requerido para EC2.
- Se mantiene cifrado del volumen raiz de EC2 mediante variable.
- Se mantiene control OPA para bloquear SSH publico y restringir instancias a `t2.micro`.

## [1.0.0] - 2026-04-28

### Added

- Configuracion inicial del repositorio con `README.md`, `.gitignore` y `CHANGELOG.md`.
- Infraestructura base con VPC, subnet, Internet Gateway, Route Table, Security Group e instancia EC2.
- Pipeline GitHub Actions con TFLint, Checkov, Terraform Validate y OPA.
- Politicas OPA para denegar SSH publico y tipos de instancia distintos de `t2.micro`.

### Fixed

- Se restringio el acceso SSH para no permitir `0.0.0.0/0`.
