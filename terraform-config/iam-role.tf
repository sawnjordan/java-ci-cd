resource "aws_iam_role" "ebs_csi_role" {
  name               = "EBSCSIRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "ebs_csi_role_attachment" {
  policy_arn = aws_iam_policy.ebs_csi_driver_policy.arn
  role       = aws_iam_role.ebs_csi_role.name
}

resource "kubernetes_service_account" "ebs_csi_service_account" {
  metadata {
    name      = "ebs-csi-driver-sa"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.ebs_csi_role.arn
    }
  }
}
