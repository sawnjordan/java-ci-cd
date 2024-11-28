resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnets
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  tags = {
    Name = var.cluster_name
    Environment = var.environment
  }
}

resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "default-node-group"
  node_role_arn   = var.node_group_role_arn
  subnets         = var.subnets
  instance_types  = var.node_group_defaults.instance_type
  desired_capacity = var.node_groups.default.desired_capacity
  min_size        = var.node_groups.default.min_size
  max_size        = var.node_groups.default.max_size

  scaling_config {
    desired_size = var.node_groups.default.desired_capacity
    min_size     = var.node_groups.default.min_size
    max_size     = var.node_groups.default.max_size
  }

  tags = {
    Name = "default-node-group"
  }
}
