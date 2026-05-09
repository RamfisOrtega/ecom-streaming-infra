output "bastion_sg_id" {
  description = "Security group ID for the bastion host"
  value       = aws_security_group.bastion.id
}

output "msk_sg_id" {
  description = "Security group ID for MSK"
  value       = aws_security_group.msk.id
}

output "rds_sg_id" {
  description = "Security group ID for RDS"
  value       = aws_security_group.rds.id
}