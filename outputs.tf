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

output "msk_cluster_arn" {
  value = module.msk.cluster_arn
}

output "msk_bootstrap_brokers" {
  value = module.msk.bootstrap_brokers
}

output "bastion_instance_profile_name" {
  value = module.iam.bastion_instance_profile_name
}

output "bastion_role_arn" {
  value = module.iam.bastion_role_arn
}

output "bastion_instance_id" {
  value = module.ec2.bastion_instance_id
}

output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}