output "bastion_instance_profile_name" {
  description = "Instance profile name for the bastion EC2"
  value       = aws_iam_instance_profile.bastion.name
}

output "bastion_role_arn" {
  description = "IAM role ARN for the bastion EC2"
  value       = aws_iam_role.bastion.arn
}