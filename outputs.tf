output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "bastion_sg_id" {
  value = module.security_groups.bastion_sg_id
}

output "msk_sg_id" {
  value = module.security_groups.msk_sg_id
}

output "rds_sg_id" {
  value = module.security_groups.rds_sg_id
}