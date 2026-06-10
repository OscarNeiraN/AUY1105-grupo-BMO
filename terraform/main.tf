module "network" {
  source = "./modules/networknashe"

  project_name               = var.project_name
  vpc_cidr                   = var.vpc_cidr
  subnet_cidr                = var.subnet_cidr
  availability_zone          = var.availability_zone
  map_public_ip_on_launch    = var.map_public_ip_on_launch
  ssh_allowed_cidr           = var.ssh_allowed_cidr
  flow_log_retention_in_days = var.flow_log_retention_in_days
}

module "compute" {
  source = "./modules/compute"

  project_name          = var.project_name
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = module.network.subnet_id
  security_group_id     = module.network.security_group_id
  monitoring            = var.monitoring
  ebs_optimized         = var.ebs_optimized
  root_volume_encrypted = var.root_volume_encrypted
}
