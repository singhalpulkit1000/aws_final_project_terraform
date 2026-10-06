variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version; null uses the latest version in standard support"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Subnets (in at least two AZs) for the cluster and nodes"
  type        = list(string)
}

variable "node_group_name" {
  description = "Managed node group name"
  type        = string
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
}

variable "node_disk_size" {
  description = "Root disk size in GB for each worker node"
  type        = number
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}
