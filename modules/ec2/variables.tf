variable "project_name" {
  description = "Name prefix used for resources and tags"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
}

variable "allowed_cidr" {
  description = "CIDR block allowed to reach the open ports"
  type        = string
}

variable "vpc_id" {
  description = "VPC for the security group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet to launch the instance in"
  type        = string
}
