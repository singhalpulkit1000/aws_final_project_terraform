variable "aws_region" {
  description = "AWS region where all resources are created"
  type        = string
  default     = "ap-south-1"
}

variable "availability_zone" {
  description = "Availability zone for the default subnet and EC2 instance"
  type        = string
  default     = "ap-south-1a"
}

variable "project_name" {
  description = "Name prefix used for resources and tags"
  type        = string
  default     = "aws-final-project"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 25
}

variable "allowed_cidr" {
  description = "CIDR block allowed to reach the open ports"
  type        = string
  default     = "0.0.0.0/0"
}
