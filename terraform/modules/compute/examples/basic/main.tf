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

variable "ami_id" {
  description = "AMI usada por el ejemplo"
  type        = string
  default     = "ami-0e86e20dae9224db8"
}

variable "subnet_id" {
  description = "ID de una subnet existente"
  type        = string
}

variable "security_group_id" {
  description = "ID de un Security Group existente"
  type        = string
}

module "compute" {
  source = "../.."

  project_name          = "example-compute"
  ami_id                = var.ami_id
  instance_type         = "t2.micro"
  subnet_id             = var.subnet_id
  security_group_id     = var.security_group_id
  monitoring            = true
  ebs_optimized         = true
  root_volume_encrypted = true
}
