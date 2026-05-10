output "ec2_sg_id" {
  description = "EC2 Security Group ID"
  value       = aws_security_group.ec2.id
}

output "rds_sg_id" {
  description = "RDS Security Group ID"
  value       = aws_security_group.rds.id
}

output "msk_sg_id" {
  description = "MSK Security Group ID"
  value       = aws_security_group.msk.id
}

output "lambda_sg_id" {
  description = "Lambda Security Group ID"
  value       = aws_security_group.lambda.id
}

output "glue_sg_id" {
  description = "Glue Security Group ID"
  value       = aws_security_group.glue.id
}

output "bastion_sg_id" {
  description = "Bastion (EC2) Security Group ID"
  value       = aws_security_group.ec2.id
}