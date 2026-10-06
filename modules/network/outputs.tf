output "vpc_id" {
  description = "ID of the default VPC"
  value       = aws_default_vpc.default.id
}

output "subnet_ids" {
  description = "IDs of the default subnets, in the same order as var.availability_zones"
  value       = [for az in var.availability_zones : aws_default_subnet.this[az].id]
}
