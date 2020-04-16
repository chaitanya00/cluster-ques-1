resource "aws_autoscaling_group" "demo" {
  desired_capacity     = 1
  launch_configuration = "${aws_launch_configuration.demo.id}"
  max_size             = 3
  min_size             = 1
  name                 = "terraform-eks-demo-asg"
  vpc_zone_identifier = ["subnet-0e2b7ad58799e0c1c","subnet-09fd2d6099eac0097","subnet-048b83a5e6b122ef7","subnet-08007562d176f5e25","subnet-005ecc27b5c79b79b"]

  tag {
    key                 = "Name"
    value               = "terraform-eks-demo"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
