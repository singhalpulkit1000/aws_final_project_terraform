# Adopts the region's default VPC, or creates it if it doesn't exist.
# On `terraform destroy` it is only removed from state, not deleted from AWS.
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}

# Adopts the default subnet in each AZ, or creates it if it doesn't exist.
# On `terraform destroy` they are only removed from state, not deleted from AWS.
# EKS needs subnets in at least two AZs.
resource "aws_default_subnet" "this" {
  for_each = toset(var.availability_zones)

  availability_zone = each.value

  tags = {
    Name = "default-subnet-${each.value}"
    # Lets Kubernetes place internet-facing load balancers in these subnets
    "kubernetes.io/role/elb" = "1"
  }

  depends_on = [aws_default_vpc.default]
}
