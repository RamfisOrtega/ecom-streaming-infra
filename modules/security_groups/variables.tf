variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "my_ip" {
  description = "Your laptop public IP in CIDR format e.g. 1.2.3.4/32"
  type        = string
}