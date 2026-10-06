variable "aws_region" {
  description = "AWS region where all resources are created"
  type        = string
  default     = "ap-south-1"
}

variable "availability_zones" {
  description = "AZs for the default subnets; the EC2 instance uses the first, EKS uses all (min two)"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "project_name" {
  description = "Name prefix used for resources and tags"
  type        = string
  default     = "aws-final-project"
}

# ---------- EC2 ----------

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

# ---------- EKS ----------

variable "enable_eks" {
  description = "Create the EKS cluster; set false to skip it (and its cost)"
  type        = bool
  default     = true
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "my-cluster"
}

variable "eks_kubernetes_version" {
  description = "Kubernetes version, e.g. \"1.33\"; null uses the latest in standard support"
  type        = string
  default     = null
}

variable "eks_node_group_name" {
  description = "Managed node group name"
  type        = string
  default     = "my-nodegroup"
}

variable "eks_node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3a.xlarge"
}

variable "eks_node_disk_size" {
  description = "Root disk size in GB for each worker node"
  type        = number
  default     = 20
}

variable "eks_node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "eks_node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "eks_node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 4
}
