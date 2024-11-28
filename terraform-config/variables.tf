variable "kubernetes_version" {
  default     = 1.30
  description = "kubernetes version"
}
variable "cluster_name" {
  default     = "dev-eks-cluster"
  description = "Cluster name"
}
locals {
  name = "dev-eks-cluster"
  tags = {
    Example = local.name
  }
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default     = "ap-south-1"
  description = "aws region"
}
variable "azs" {
  default     = ["aps1-az1", "aps1-az2"]
  description = "aws azs"
}
variable "private_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "Private Subnets"
}
variable "public_subnets" {
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
  description = "Public Subnets"
}
variable "intra_subnets" {
  default     = ["10.0.6.0/24", "10.0.7.0/24"]
  description = "Intra Subnets"
}
variable "instance_types" {
  default     = ["t3.medium"]
  description = "Cluster node instance types"
}
variable "environment" {
  default     = "dev"
  description = "Cluster environment"
}

