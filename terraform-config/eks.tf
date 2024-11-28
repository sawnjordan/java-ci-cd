module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "${var.environment}-${var.cluster_name}"
  cluster_version = var.kubernetes_version

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = var.instance_types

    # attach_cluster_primary_security_group = true
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {
    "${var.environment}-cluster-wg" = {
      min_size     = 2
      max_size     = 5
      desired_size = 2

      instance_types = var.instance_types

    }
  }

  tags = {
    Environment = var.environment
  }
}