output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = module.ec2.public_dns
}

output "ami_id" {
  description = "Ubuntu AMI used for the instance"
  value       = module.ec2.ami_id
}

output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = module.ec2.ssh_command
}

output "eks_cluster_name" {
  description = "EKS cluster name (null when enable_eks = false)"
  value       = one(module.eks[*].cluster_name)
}

output "eks_cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = one(module.eks[*].cluster_endpoint)
}

output "eks_kubernetes_version" {
  description = "Kubernetes version of the cluster"
  value       = one(module.eks[*].kubernetes_version)
}

output "eks_kubeconfig_command" {
  description = "Command to configure kubectl for the cluster"
  value       = var.enable_eks ? "aws eks update-kubeconfig --region ${var.aws_region} --name ${var.eks_cluster_name}" : null
}
