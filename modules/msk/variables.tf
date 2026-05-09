variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs where MSK will be deployed"
  type        = list(string)
}

variable "msk_sg_id" {
  description = "Security group ID for MSK"
  type        = string
}