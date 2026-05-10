output "lambda_role_arn" {
  description = "Lambda IAM Role ARN"
  value       = aws_iam_role.lambda.arn
}

output "msk_connect_role_arn" {
  description = "MSK Connect IAM Role ARN"
  value       = aws_iam_role.msk_connect.arn
}

output "glue_role_arn" {
  description = "Glue IAM Role ARN"
  value       = aws_iam_role.glue.arn
}

output "ec2_role_arn" {
  description = "EC2 IAM Role ARN"
  value       = aws_iam_role.ec2.arn
}

output "bastion_instance_profile_name" {
  description = "EC2 Instance Profile Name"
  value       = aws_iam_instance_profile.ec2.name
}

output "bastion_role_arn" {
  description = "EC2 Bastion Role ARN"
  value       = aws_iam_role.ec2.arn
}