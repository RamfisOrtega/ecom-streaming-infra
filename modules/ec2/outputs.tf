output "bastion_instance_id" {
  description = "EC2 Bastion Instance ID"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "EC2 Bastion Public IP"
  value       = aws_instance.bastion.public_ip
}

output "bastion_ami_id" {
  description = "AMI used for bastion"
  value       = aws_instance.bastion.ami
}