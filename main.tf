# Create a VPC

resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}



resource "aws_eks_cluster" "debaj-eks" {
  name     = "debaj-eks-cluster"
  role_arn = aws_iam_role.debaj_app_eks_role.arn

  vpc_config {

    subnet_ids = var.subnet_ranges
  }

  depends_on = [aws_iam_role_policy_attachment.debaj_eks_policy]
}

# AWS node group

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.debaj-eks.name
  node_group_name = "debaj-node-group"
  node_role_arn   = aws_iam_role.debaj_node_instance_role.arn
  subnet_ids      = var.subnet_ranges

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}