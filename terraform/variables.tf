variable "project_name" {
  description = "Nombre base para etiquetar y nombrar los recursos de infraestructura"
  type        = string
}

variable "aws_region" {
  description = "Region de AWS donde se desplegara la infraestructura"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "Bloque CIDR para la subred publica"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidad donde se desplegara la subred"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Indica si la subnet asigna IP publica automaticamente al lanzar instancias"
  type        = bool
}

variable "ami_id" {
  description = "AMI de Ubuntu 24.04 LTS para la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR permitido para acceso SSH (no usar 0.0.0.0/0)"
  type        = string
}

variable "flow_log_retention_in_days" {
  description = "Cantidad de dias de retencion para los logs de flujo de VPC"
  type        = number
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
