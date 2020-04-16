resource "aws_autoscaling_group" "demo" {
  desired_capacity     = 1
  launch_configuration = "${aws_launch_configuration.demo.id}"
  max_size             = 3
  min_size             = 1
  name                 = "terraform-eks-demo-asg"
  vpc_zone_identifier = ["subnet-01ca5f283e4f3e08e","subnet-0e25a646f6f7061b0"]

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
