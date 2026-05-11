output "cluster_arn" {
  description = "MSK Cluster ARN"
  value       = aws_msk_cluster.main.arn
}

output "cluster_name" {
  description = "MSK Cluster Name"
  value       = aws_msk_cluster.main.cluster_name
}

output "bootstrap_brokers" {
  description = "MSK Bootstrap Brokers"
  value       = aws_msk_cluster.main.bootstrap_brokers_sasl_iam
}