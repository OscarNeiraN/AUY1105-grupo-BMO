output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "ID de la subred publica creada"
  value       = aws_subnet.public.id
}

output "subnet_ids" {
  description = "Lista de IDs de subredes creadas por el modulo"
  value       = [aws_subnet.public.id]
}

output "security_group_id" {
  description = "ID del Security Group creado"
  value       = aws_security_group.app.id
}
