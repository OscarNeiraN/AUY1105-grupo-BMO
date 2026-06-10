moved {
  from = aws_vpc.AUY1105-duocapp-vpc
  to   = module.network.aws_vpc.this
}

moved {
  from = aws_default_security_group.AUY1105-duocapp-default-sg
  to   = module.network.aws_default_security_group.this
}

moved {
  from = aws_kms_key.AUY1105-duocapp-kms
  to   = module.network.aws_kms_key.flow_logs
}

moved {
  from = aws_cloudwatch_log_group.AUY1105-duocapp-lg
  to   = module.network.aws_cloudwatch_log_group.flow_logs
}

moved {
  from = aws_iam_role.AUY1105-duocapp-flowlogs-role
  to   = module.network.aws_iam_role.flow_logs
}

moved {
  from = aws_iam_role_policy.AUY1105-duocapp-flowlogs-policy
  to   = module.network.aws_iam_role_policy.flow_logs
}

moved {
  from = aws_flow_log.AUY1105-duocapp-flowlog
  to   = module.network.aws_flow_log.this
}

moved {
  from = aws_subnet.AUY1105-duocapp-subnet
  to   = module.network.aws_subnet.public
}

moved {
  from = aws_internet_gateway.AUY1105-duocapp-igw
  to   = module.network.aws_internet_gateway.this
}

moved {
  from = aws_route_table.AUY1105-duocapp-rt
  to   = module.network.aws_route_table.public
}

moved {
  from = aws_route_table_association.AUY1105-duocapp-rta
  to   = module.network.aws_route_table_association.public
}

moved {
  from = aws_security_group.AUY1105-duocapp-sg
  to   = module.network.aws_security_group.app
}

moved {
  from = aws_iam_role.AUY1105-duocapp-ec2-role
  to   = module.compute.aws_iam_role.ec2
}

moved {
  from = aws_iam_instance_profile.AUY1105-duocapp-ec2-profile
  to   = module.compute.aws_iam_instance_profile.ec2
}

moved {
  from = aws_instance.AUY1105-duocapp-ec2
  to   = module.compute.aws_instance.this
}
