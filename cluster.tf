resource "aws_eks_cluster" "demo" {
  name            = "${var.cluster-name}"
  role_arn        = "${aws_iam_role.demo-node.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.demo-cluster.id}"]
    subnet_ids         = ["subnet-0a06a61489857f551","subnet-048f22a93cccddd05","subnet-0253e60d03b95a44d","subnet-07ad0608f84857734","subnet-001fba6d0c8efc34a"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy",
  ]
}
