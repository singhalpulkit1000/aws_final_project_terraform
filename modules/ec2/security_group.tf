resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow SSH, HTTP and app ports 3000-9000"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.ec2_sg.id
  description       = "SSH"
  cidr_ipv4         = var.allowed_cidr
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.ec2_sg.id
  description       = "HTTP"
  cidr_ipv4         = var.allowed_cidr
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "app_ports" {
  security_group_id = aws_security_group.ec2_sg.id
  description       = "App ports 3000-9000"
  cidr_ipv4         = var.allowed_cidr
  ip_protocol       = "tcp"
  from_port         = 3000
  to_port           = 9000
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.ec2_sg.id
  description       = "Allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
