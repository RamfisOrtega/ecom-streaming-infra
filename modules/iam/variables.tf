variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "msk_cluster_arn" {
  description = "ARN of the MSK Serverless cluster"
  type        = string
}