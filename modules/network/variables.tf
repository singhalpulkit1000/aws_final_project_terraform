variable "availability_zones" {
  description = "AZs to adopt default subnets in (at least two for EKS)"
  type        = list(string)
}
