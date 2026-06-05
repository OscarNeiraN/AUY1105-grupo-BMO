variable "project_name" {
  description = "Nombre base para etiquetar y nombrar los recursos de red"
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

variable "ssh_allowed_cidr" {
  description = "CIDR permitido para acceso SSH"
  type        = string
}

variable "flow_log_retention_in_days" {
  description = "Cantidad de dias de retencion para los logs de flujo de VPC"
  type        = number
}
