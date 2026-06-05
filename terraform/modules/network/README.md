# Terraform AWS Network Module

Modulo reutilizable para crear la capa de red base de la infraestructura del grupo BMO en AWS.

## Objetivo

Crear recursos de red desacoplados del Terraform principal para que puedan ser llamados desde este repositorio u otros proyectos Terraform.

## Recursos

- `aws_vpc`
- `aws_default_security_group`
- `aws_subnet`
- `aws_internet_gateway`
- `aws_route_table`
- `aws_route_table_association`
- `aws_security_group`
- `aws_kms_key`
- `aws_cloudwatch_log_group`
- `aws_iam_role`
- `aws_iam_role_policy`
- `aws_flow_log`

## Requisitos

| Nombre | Version |
|---|---|
| Terraform | `>= 1.0` |
| AWS Provider | `~> 6.0` |

## Dependencias

- Credenciales AWS configuradas en el entorno que ejecuta Terraform.
- Permisos para administrar VPC, subnets, security groups, IAM, KMS, CloudWatch Logs y VPC Flow Logs.
- Un provider AWS configurado en el root module que llama este modulo.

## Uso

```hcl
module "network" {
  source = "./modules/network"

  project_name               = "AUY1105-duocapp"
  vpc_cidr                   = "10.1.0.0/16"
  subnet_cidr                = "10.1.1.0/24"
  availability_zone          = "us-east-1a"
  map_public_ip_on_launch    = false
  ssh_allowed_cidr           = "10.0.0.0/8"
  flow_log_retention_in_days = 365
}
```

## Inputs

| Nombre | Tipo | Descripcion |
|---|---|---|
| `project_name` | `string` | Nombre base para etiquetas y nombres de recursos. |
| `vpc_cidr` | `string` | Bloque CIDR de la VPC. |
| `subnet_cidr` | `string` | Bloque CIDR de la subnet publica. |
| `availability_zone` | `string` | Zona de disponibilidad donde se crea la subnet. |
| `map_public_ip_on_launch` | `bool` | Define si la subnet asigna IP publica al lanzar instancias. |
| `ssh_allowed_cidr` | `string` | CIDR autorizado para SSH. No usar `0.0.0.0/0`. |
| `flow_log_retention_in_days` | `number` | Dias de retencion de logs de flujo de VPC. |

## Outputs

| Nombre | Descripcion |
|---|---|
| `vpc_id` | ID de la VPC creada. |
| `subnet_id` | ID de la subnet creada. |
| `subnet_ids` | Lista de IDs de subnets creadas. |
| `security_group_id` | ID del Security Group de aplicacion. |

## Ejemplos

Ver `examples/basic` para un ejemplo funcional minimo.

## Versionado

Version actual: `v1.0.1`.

En monorepo, usar el tag recomendado `network-v1.0.1`.
