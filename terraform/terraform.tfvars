project_name = "AUY1105-duocapp"

aws_region = "us-east-1"

vpc_cidr    = "10.1.0.0/16"
subnet_cidr = "10.1.1.0/24"

availability_zone       = "us-east-1a"
map_public_ip_on_launch = false

ami_id                = "ami-0e86e20dae9224db8"
instance_type         = "t2.micro"
monitoring            = true
ebs_optimized         = true
root_volume_encrypted = true

ssh_allowed_cidr = "10.0.0.0/8"

flow_log_retention_in_days = 365
