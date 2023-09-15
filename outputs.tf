output "cluster_name" {
  value = module.aws_eks.cluster_name
  description = "The name of the AWS EKS cluster."
}

output "cluster_id" {
  value = module.aws_eks.cluster_id
  description = "The unique identifier of the AWS EKS cluster."
}

output "eks_cluster_endpoint" {
  value = module.aws_eks.cluster_endpoint
  description = "The endpoint URL for the Kubernetes API server of the AWS EKS cluster."
}

output "eks_cluster_certificate_authority_data" {
  value = module.aws_eks.cluster_certificate_authority_data
  description = "The base64-encoded certificate data required to communicate securely with the Kubernetes API server of the AWS EKS cluster."
}

output "eks_managed_node_groups_autoscaling_group_names" {
  value = module.aws_eks.eks_managed_node_groups_autoscaling_group_names
  description = "The names of the Auto Scaling groups associated with the managed node groups in the AWS EKS cluster."
}

output "eks_oidc_provider_arn" {
  value = module.aws_eks.oidc_provider_arn
}

output "cluster_tls_certificate_sha1_fingerprint" {
  value = module.aws_eks.cluster_tls_certificate_sha1_fingerprint
}

output "aws_eks_cluster_auth_token" {
  value = data.aws_eks_cluster_auth.default.token
}