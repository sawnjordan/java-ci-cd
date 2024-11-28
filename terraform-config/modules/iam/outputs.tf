output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster.arn
}

output "node_group_role_arn" {
  value = aws_iam_role.node_group.arn
}
