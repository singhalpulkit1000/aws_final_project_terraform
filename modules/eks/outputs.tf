output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "kubernetes_version" {
  description = "Kubernetes version of the cluster"
  value       = aws_eks_cluster.this.version
}
