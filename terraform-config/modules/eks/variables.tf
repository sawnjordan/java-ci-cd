variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Version of Kubernetes for the EKS cluster"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be created"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS cluster"
  type        = string
}

variable "node_group_role_arn" {
  description = "IAM role ARN for the EKS node group"
  type        = string
}

variable "node_group_defaults" {
  description = "Default values for the node group"
  type        = object({
    instance_type = string
  })
}

variable "node_groups" {
  description = "Node groups configuration"
  type        = any
}
