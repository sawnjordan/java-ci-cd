provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  environment     = var.environment
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# IAM Module
module "iam" {
  source      = "./modules/iam"
  environment = var.environment
}

# EKS Module
module "eks" {
  source = "./modules/eks"

  cluster_name    = "${var.environment}-eks-cluster"
  cluster_version = var.cluster_version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  cluster_role_arn    = module.iam.eks_cluster_role_arn
  node_group_role_arn = module.iam.node_group_role_arn

  node_group_defaults = {
    instance_type = "t3.medium"
  }

  node_groups = {
    default = {
      desired_capacity = 2
      min_size         = 1
      max_size         = 3
      instance_types   = ["t3.medium"]
      key_name         = var.key_name
    }
  }
}
