# Get latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 Bastion Instance
resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.ec2_sg_id]
  iam_instance_profile   = var.instance_profile_name
  associate_public_ip_address = true

  # Install tools on first boot
  user_data = <<-EOF
    #!/bin/bash
    set -e

    # Update system
    dnf update -y

    # Install PostgreSQL client
    dnf install -y postgresql15

    # Install Java (needed for Kafka tools)
    dnf install -y java-17-amazon-corretto-headless

    # Install Kafka tools
    mkdir -p /opt/kafka
    cd /opt/kafka
    curl -sL https://archive.apache.org/dist/kafka/3.6.1/kafka_2.13-3.6.1.tgz -o kafka.tgz
    tar -xzf kafka.tgz --strip-components=1
    rm -f kafka.tgz

    # Add Kafka to PATH for all users
    echo 'export PATH=$PATH:/opt/kafka/bin' >> /etc/profile.d/kafka.sh
    chmod +x /etc/profile.d/kafka.sh

    # Signal completion
    echo "Bootstrap complete" > /var/log/user-data-complete.log
  EOF

  tags = {
    Name = "${var.project_name}-${var.environment}-bastion"
  }
}