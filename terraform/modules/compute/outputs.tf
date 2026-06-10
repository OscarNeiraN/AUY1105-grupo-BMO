output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = aws_instance.this.id
}

output "instance_ip" {
  description = "IP publica de la instancia EC2"
  value       = aws_instance.this.public_ip
}

output "ec2_instance_id" {
  description = "Alias compatible para el ID de la instancia EC2"
  value       = aws_instance.this.id
}

output "ec2_public_ip" {
  description = "Alias compatible para la IP publica de la instancia EC2"
  value       = aws_instance.this.public_ip
}
