output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "subnet_id" {
  description = "ID de la subred publica creada"
  value       = module.network.subnet_id
}

output "subnet_ids" {
  description = "Lista de IDs de subredes creadas por el modulo de red"
  value       = module.network.subnet_ids
}

output "security_group_id" {
  description = "ID del Security Group creado"
  value       = module.network.security_group_id
}

output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = module.compute.instance_id
}

output "instance_ip" {
  description = "IP publica de la instancia EC2"
  value       = module.compute.instance_ip
}

output "ec2_instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = module.compute.instance_id
}

output "ec2_public_ip" {
  description = "IP publica de la instancia EC2"
  value       = module.compute.instance_ip
}
