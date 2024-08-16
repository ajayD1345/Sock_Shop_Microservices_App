output "cluster_name" {
  value = aws_eks_cluster.clusterbox
}

output "kubeconfig" {
  value = aws_eks_cluster.clusterbox.endpoint
}

