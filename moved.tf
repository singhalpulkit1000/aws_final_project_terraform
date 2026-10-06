# Resources moved into modules. These tell Terraform the existing resources
# only changed address, so nothing is destroyed or recreated.
# Safe to delete once every state file has been applied with them.

moved {
  from = aws_default_vpc.default
  to   = module.network.aws_default_vpc.default
}

moved {
  from = aws_default_subnet.default
  to   = module.network.aws_default_subnet.default
}

# The single subnet became one subnet per AZ (for_each)
moved {
  from = module.network.aws_default_subnet.default
  to   = module.network.aws_default_subnet.this["ap-south-1a"]
}

moved {
  from = tls_private_key.ec2_key
  to   = module.ec2.tls_private_key.ec2_key
}

moved {
  from = aws_key_pair.ec2_key
  to   = module.ec2.aws_key_pair.ec2_key
}

moved {
  from = local_sensitive_file.private_key_pem
  to   = module.ec2.local_sensitive_file.private_key_pem
}

moved {
  from = aws_security_group.ec2_sg
  to   = module.ec2.aws_security_group.ec2_sg
}

moved {
  from = aws_vpc_security_group_ingress_rule.ssh
  to   = module.ec2.aws_vpc_security_group_ingress_rule.ssh
}

moved {
  from = aws_vpc_security_group_ingress_rule.http
  to   = module.ec2.aws_vpc_security_group_ingress_rule.http
}

moved {
  from = aws_vpc_security_group_ingress_rule.app_ports
  to   = module.ec2.aws_vpc_security_group_ingress_rule.app_ports
}

moved {
  from = aws_vpc_security_group_egress_rule.all_outbound
  to   = module.ec2.aws_vpc_security_group_egress_rule.all_outbound
}

moved {
  from = aws_instance.app_server
  to   = module.ec2.aws_instance.app_server
}
