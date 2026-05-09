output "cluster_arn" {
  description = "ARN of the MSK Serverless cluster"
  value       = aws_msk_serverless_cluster.main.arn
}

output "bootstrap_brokers" {
  description = "IAM bootstrap broker endpoint"
  value       = aws_msk_serverless_cluster.main.bootstrap_brokers_sasl_iam
}