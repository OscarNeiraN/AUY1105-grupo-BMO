variable "project_name" {
  description = "Nombre base para etiquetar y nombrar los recursos de computo"
  type        = string
}

variable "ami_id" {
  description = "AMI para la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet donde se desplegara la instancia EC2"
  type        = string
}

variable "security_group_id" {
  description = "ID del Security Group asociado a la instancia EC2"
  type        = string
}

variable "monitoring" {
  description = "Habilita monitoreo detallado para la instancia EC2"
  type        = bool
}

variable "ebs_optimized" {
  description = "Habilita optimizacion EBS para la instancia EC2"
  type        = bool
}

variable "root_volume_encrypted" {
  description = "Indica si el volumen raiz de la instancia EC2 se cifra"
  type        = bool
}
