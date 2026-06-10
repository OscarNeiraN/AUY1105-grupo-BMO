# Compute Module Examples

Esta carpeta contiene ejemplos de uso del modulo `compute`.

## Ejemplo disponible

- `basic`: crea una instancia EC2 a partir de una subnet y un security group existentes.

Para ejecutar:

```bash
cd terraform/modules/compute/examples/basic
terraform init
terraform plan -var="subnet_id=<subnet-id>" -var="security_group_id=<security-group-id>"
```
