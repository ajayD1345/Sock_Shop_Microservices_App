variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "clusterbox"
}

variable "ec2_ssh_key_name" {
  description = "The name of the EC2 SSH key pair"
  default     = "id.xar"
}
