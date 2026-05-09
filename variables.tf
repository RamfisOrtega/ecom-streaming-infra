variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix used across all resources"
  type        = string
  default     = "ecom-streaming"
}

variable "my_ip" {
  description = "Your laptop public IP in CIDR format"
  type        = string
}