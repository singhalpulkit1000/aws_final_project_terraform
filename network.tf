# Adopts the region's default VPC, or creates it if it doesn't exist.
# On `terraform destroy` it is only removed from state, not deleted from AWS.
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}

# Adopts the default subnet in the chosen AZ, or creates it if it doesn't exist.
# On `terraform destroy` it is only removed from state, not deleted from AWS.
resource "aws_default_subnet" "default" {
  availability_zone = var.availability_zone

  tags = {
    Name = "default-subnet-${var.availability_zone}"
  }

  depends_on = [aws_default_vpc.default]
}
