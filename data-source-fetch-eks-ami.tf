data "aws_ami" "eks-worker" {
   filter {
     name   = "name"
     values = ["eks-worker-*"]
   }

   most_recent = true
   owners      = ["602401143452"] # Amazon EKS AMI Account ID
 }
