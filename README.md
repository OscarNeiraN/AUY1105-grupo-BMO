# AUY1105-grupo-BMO

## Infraestructura como Codigo II - Evaluacion Parcial 2

Este repositorio contiene la infraestructura AWS definida con Terraform y organizada como monorepo. La pauta menciona repositorios separados para el modulo de redes y el modulo de computo, pero esta entrega mantiene todo en un unico repositorio, usando `terraform/modules/network` y `terraform/modules/compute` como modulos locales reutilizables.

## Objetivos

- Desacoplar la infraestructura de la Evaluacion Parcial 1 en modulos reutilizables.
- Usar un `main.tf` raiz como controlador central de la infraestructura.
- Parametrizar los datos de infraestructura mediante `terraform/terraform.tfvars`.
- Mantener validaciones de calidad, seguridad y politicas con GitHub Actions, TFLint, Checkov, Terraform Validate y OPA.
- Documentar los modulos con ejemplos, variables, outputs, dependencias y versionado semantico.

## Estructura

```text
AUY1105-grupo-BMO/
|-- .github/
|   `-- workflows/
|       |-- main.yaml
|       |-- opa-validation.yaml
|       |-- tflint-checkov.yaml
|       `-- validate.yaml
|-- policies/
|   |-- no_public_ssh.rego
|   `-- only_t2_micro.rego
|-- terraform/
|   |-- main.tf
|   |-- moved.tf
|   |-- outputs.tf
|   |-- provider.tf
|   |-- terraform.tfvars
|   |-- variables.tf
|   |-- versions.tf
|   `-- modules/
|       |-- network/
|       |   |-- CHANGELOG.md
|       |   |-- README.md
|       |   |-- VERSION
|       |   |-- examples/
|       |   |-- main.tf
|       |   |-- outputs.tf
|       |   |-- variables.tf
|       |   `-- versions.tf
|       `-- compute/
|           |-- CHANGELOG.md
|           |-- README.md
|           |-- VERSION
|           |-- examples/
|           |-- main.tf
|           |-- outputs.tf
|           |-- variables.tf
|           `-- versions.tf
|-- .gitignore
|-- CHANGELOG.md
`-- README.md
```

## Modulos

### Network

Ruta: `terraform/modules/network`

Gestiona recursos de red y observabilidad:

- VPC.
- Default Security Group administrado.
- Subnet publica.
- Internet Gateway.
- Route Table y asociacion.
- Security Group de aplicacion.
- KMS, CloudWatch Log Group, IAM Role y VPC Flow Logs.

Outputs minimos de la pauta:

- `vpc_id`
- `subnet_ids`

Tambien expone `subnet_id` y `security_group_id` para integrar el modulo de computo.

### Compute

Ruta: `terraform/modules/compute`

Gestiona recursos de computo:

- IAM Role para EC2.
- IAM Instance Profile.
- Instancia EC2 con IMDSv2 requerido, volumen raiz cifrado, monitoreo y EBS optimization parametrizados.

Outputs minimos de la pauta:

- `instance_id`
- `instance_ip`

Tambien mantiene alias compatibles `ec2_instance_id` y `ec2_public_ip`.

## Uso del Terraform principal

Pre-requisitos:

- Terraform instalado.
- Credenciales AWS configuradas.
- Permisos AWS para EC2, VPC, IAM, KMS y CloudWatch Logs.

Comandos:

```bash
cd terraform
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
terraform apply
```

Terraform carga automaticamente `terraform.tfvars`. Este archivo contiene datos no sensibles del laboratorio, como CIDR, region, AMI y tipo de instancia. No se deben guardar secretos, claves privadas ni credenciales AWS en archivos versionados.

## Archivos versionados

- `terraform/terraform.tfvars` se versiona porque contiene datos no sensibles de laboratorio.
- `.terraform/`, estados, planes, claves privadas y credenciales se ignoran en `.gitignore`.
- `**/.terraform.lock.hcl` se ignora y fue removido del repositorio para que no aparezca en GitHub.

## Automatizacion

El pipeline se activa en pushes a `main` y Pull Requests hacia `main` mediante `.github/workflows/main.yaml`. El workflow central llama workflows reutilizables:

1. TFLint recursivo para revisar root module, modulos y ejemplos.
2. Checkov para analisis de seguridad Terraform.
3. `terraform fmt` y `terraform validate`.
4. OPA contra el plan JSON para validar politicas:
   - Bloquear SSH publico desde `0.0.0.0/0`.
   - Permitir solo instancias `t2.micro`.

## Versionado semantico

Version actual del repositorio principal: `v2.0.2`.

Versiones actuales de modulos:

- Network: `network-v1.0.2`
- Compute: `compute-v1.0.1`

Como el trabajo se mantiene en un solo repositorio, se usan tags por modulo y tag general del repositorio:

```bash
git tag v2.0.2
git tag network-v1.0.2
git tag compute-v1.0.1
git push origin v2.0.2 network-v1.0.2 compute-v1.0.1
```

En GitHub, crear releases con esos tags e incluir el resumen de cambios indicado en cada `CHANGELOG.md`.

## Integrantes

| Nombre | Usuario GitHub |
|---|---|
| Oscar Neira | OscarNeiraN |
| Brandon Figueroa | gat0hub |
| Matias Araya | maearaya |
