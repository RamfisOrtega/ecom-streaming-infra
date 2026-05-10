variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ecom-streaming"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "my_ip" {
  description = "Your laptop public IP for SSH access"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}