terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "Region AWS para el ejemplo"
  type        = string
  default     = "us-east-1"
}

module "network" {
  source = "../.."

  project_name               = "example-network"
  vpc_cidr                   = "10.10.0.0/16"
  subnet_cidr                = "10.10.1.0/24"
  availability_zone          = "us-east-1a"
  map_public_ip_on_launch    = false
  ssh_allowed_cidr           = "10.10.0.0/16"
  flow_log_retention_in_days = 365
}
