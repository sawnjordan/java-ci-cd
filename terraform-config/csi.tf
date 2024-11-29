resource "helm_release" "aws_ebs_csi_driver" {
  name       = "aws-ebs-csi-driver"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  version    = "1.12.0"

  values = [
    "controller.serviceAccount.create=false",
    "controller.serviceAccount.name=ebs-csi-driver-sa",
    "node.serviceAccount.create=false",
    "node.serviceAccount.name=ebs-csi-driver-sa",
    "storageClasses.create=true",
    "storageClasses.name=ebs-sc",
    "storageClasses.provisioner=ebs.csi.aws.com",
    "storageClasses.reclaimPolicy=Retain",
    "storageClasses.volumeBindingMode=WaitForFirstConsumer"
  ]
}