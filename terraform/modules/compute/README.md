# Terraform AWS Compute Module

Modulo reutilizable para desplegar una instancia EC2 y los recursos IAM necesarios para asociarle un instance profile.

## Objetivo

Separar la capa de computo del Terraform principal y permitir que la instancia EC2 pueda integrarse con distintas redes entregando `subnet_id` y `security_group_id`.

## Recursos

- `aws_iam_role`
- `aws_iam_instance_profile`
- `aws_instance`

## Requisitos

| Nombre | Version |
|---|---|
| Terraform | `>= 1.0` |
| AWS Provider | `~> 6.0` |

## Dependencias

- Credenciales AWS configuradas en el entorno que ejecuta Terraform.
- Permisos para administrar EC2 e IAM.
- Una subnet existente.
- Un Security Group existente.
- Una AMI valida para la region donde se despliega.
- Un provider AWS configurado en el root module que llama este modulo.

## Uso

```hcl
module "compute" {
  source = "./modules/compute"

  project_name          = "AUY1105-duocapp"
  ami_id                = "ami-0e86e20dae9224db8"
  instance_type         = "t2.micro"
  subnet_id             = module.network.subnet_id
  security_group_id     = module.network.security_group_id
  monitoring            = true
  ebs_optimized         = true
  root_volume_encrypted = true
}
```

## Inputs

| Nombre | Tipo | Descripcion |
|---|---|---|
| `project_name` | `string` | Nombre base para etiquetas y nombres de recursos. |
| `ami_id` | `string` | AMI usada para la instancia EC2. |
| `instance_type` | `string` | Tipo de instancia EC2. |
| `subnet_id` | `string` | ID de la subnet donde se desplegara la instancia. |
| `security_group_id` | `string` | ID del Security Group asociado a la instancia. |
| `monitoring` | `bool` | Habilita monitoreo detallado de EC2. |
| `ebs_optimized` | `bool` | Habilita optimizacion EBS. |
| `root_volume_encrypted` | `bool` | Cifra el volumen raiz de la instancia. |

## Outputs

| Nombre | Descripcion |
|---|---|
| `instance_id` | ID de la instancia EC2 creada. |
| `instance_ip` | IP publica de la instancia EC2. |
| `ec2_instance_id` | Alias compatible para el ID de la instancia. |
| `ec2_public_ip` | Alias compatible para la IP publica. |

## Ejemplos

Ver `examples/basic` para un ejemplo funcional minimo.

Los ejemplos no versionan `.terraform.lock.hcl`; ese archivo se ignora por politica del repositorio para evitar que aparezca en GitHub.

## Versionado

Version actual: `v1.0.1`.

En monorepo, usar el tag recomendado `compute-v1.0.1`.
