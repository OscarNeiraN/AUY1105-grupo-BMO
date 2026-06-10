output "instance_id" {
  description = "ID de la instancia EC2 creada por el ejemplo"
  value       = module.compute.instance_id
}

output "instance_ip" {
  description = "IP publica de la instancia EC2 creada por el ejemplo"
  value       = module.compute.instance_ip
}
