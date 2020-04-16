data "aws_region" "current" {
}

locals {
  demo-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.demo.endpoint}' --b64-cluster-ca '${aws_eks_cluster.demo.certificate_authority[0].data}' '${var.cluster-name}'
USERDATA
}
resource "aws_launch_configuration" "demo" {
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.demo-node.name}"
  image_id                    = "${data.aws_ami.eks-worker.id}"
  instance_type               = "t2.medium"
  name_prefix                 = "terraform-eks-demo"
  security_groups  = ["${aws_security_group.demo-node.id}"]
  user_data_base64 = "${base64encode(local.demo-node-userdata)}"

  lifecycle {
    create_before_destroy = true
  }
}
