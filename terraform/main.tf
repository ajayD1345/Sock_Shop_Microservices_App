resource "aws_eks_cluster" "clusterbox" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = aws_subnet.cluster-1[*].id
  }

  depends_on = [aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy]
}

resource "aws_eks_node_group" "sockshop" {
  depends_on = [
    aws_eks_cluster.clusterbox
  ]

  cluster_name    = var.cluster_name
  node_group_name = "sockshop"
  node_role_arn   = aws_iam_role.eksng.arn
  subnet_ids      = aws_subnet.cluster-1[*].id
  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  disk_size       = 20
  instance_types   = ["t3.medium"]

  scaling_config {
    desired_size = 4
    max_size     = 5
    min_size     = 2
  }

}
