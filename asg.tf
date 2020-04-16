resource "aws_autoscaling_group" "demo" {
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.demo.id
  max_size             = 3
  min_size             = 1
  name                 = "terraform-eks-demo-asg"
  vpc_zone_identifier = ["subnet-0a06a61489857f551","subnet-048f22a93cccddd05","subnet-0253e60d03b95a44d","subnet-07ad0608f84857734","subnet-001fba6d0c8efc34a"]

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
