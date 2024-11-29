# I am policy for CSI Driver
resource "aws_iam_policy" "ebs_csi_driver_policy" {
  name        = "EBSCSIDriverPolicy"
  description = "Policy for EBS CSI driver to manage EBS volumes"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ec2:DescribeVolumes",
          "ec2:DescribeSnapshots",
          "ec2:DescribeVolumeStatus",
          "ec2:CreateVolume",
          "ec2:DeleteVolume",
          "ec2:AttachVolume",
          "ec2:DetachVolume",
          "ec2:ModifyVolume",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot",
          "ec2:DescribeInstances",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeInstanceTypes"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets"
        ]
        Resource = "*"
      }
    ]
  })
}
