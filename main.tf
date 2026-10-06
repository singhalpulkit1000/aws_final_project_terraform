module "network" {
  source = "./modules/network"

  availability_zones = var.availability_zones
}

module "ec2" {
  source = "./modules/ec2"

  project_name     = var.project_name
  instance_type    = var.instance_type
  root_volume_size = var.root_volume_size
  allowed_cidr     = var.allowed_cidr
  vpc_id           = module.network.vpc_id
  subnet_id        = module.network.subnet_ids[0]
}

module "eks" {
  source = "./modules/eks"
  count  = var.enable_eks ? 1 : 0

  cluster_name       = var.eks_cluster_name
  kubernetes_version = var.eks_kubernetes_version
  subnet_ids         = module.network.subnet_ids
  node_group_name    = var.eks_node_group_name
  node_instance_type = var.eks_node_instance_type
  node_disk_size     = var.eks_node_disk_size
  node_desired_size  = var.eks_node_desired_size
  node_min_size      = var.eks_node_min_size
  node_max_size      = var.eks_node_max_size
}
