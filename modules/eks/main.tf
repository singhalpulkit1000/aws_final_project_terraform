# Kubernetes versions currently in EKS standard support ($0.10/hr, not extended support)
data "aws_eks_cluster_versions" "standard" {
  version_status = "STANDARD_SUPPORT"
}

locals {
  # Use the given version, or the newest one in standard support
  kubernetes_version = coalesce(
    var.kubernetes_version,
    reverse(sort([for v in data.aws_eks_cluster_versions.standard.cluster_versions : v.cluster_version]))[0]
  )
}

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  version  = local.kubernetes_version
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_public_access  = true
    endpoint_private_access = true
  }

  # Access entries API; the IAM identity running Terraform becomes cluster admin,
  # so kubectl works right after `aws eks update-kubeconfig`
  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_policy]
}

# Managed node group (like eksctl --managed)
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids

  ami_type       = "AL2023_x86_64_STANDARD"
  instance_types = [var.node_instance_type]
  capacity_type  = "ON_DEMAND"
  disk_size      = var.node_disk_size

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  update_config {
    max_unavailable = 1
  }

  # Let a cluster autoscaler change the node count without Terraform reverting it
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_worker_policy,
    aws_iam_role_policy_attachment.node_cni_policy,
    aws_iam_role_policy_attachment.node_ecr_policy,
  ]
}
