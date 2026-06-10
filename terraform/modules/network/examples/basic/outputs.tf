output "vpc_id" {
  description = "ID de la VPC creada por el ejemplo"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "IDs de subnets creadas por el ejemplo"
  value       = module.network.subnet_ids
}

output "security_group_id" {
  description = "ID del Security Group creado por el ejemplo"
  value       = module.network.security_group_id
}
