# --- Bastion Security Group ---
resource "aws_security_group" "bastion" {
  name        = "${var.project_name}-bastion-sg"
  description = "Allow SSH from my laptop only"
  vpc_id      = var.vpc_id

  # SSH from your laptop only
  ingress {
    description = "SSH from my laptop"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # All outbound traffic allowed
  # SSM Session Manager works through this — it opens HTTPS (443) outbound to AWS
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-bastion-sg"
  }
}

# --- MSK Security Group ---
resource "aws_security_group" "msk" {
  name        = "${var.project_name}-msk-sg"
  description = "Allow Kafka traffic from bastion only"
  vpc_id      = var.vpc_id

  # MSK Serverless uses port 9098 for IAM-authenticated traffic
  ingress {
    description     = "Kafka from bastion"
    from_port       = 9098
    to_port         = 9098
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-msk-sg"
  }
}

# --- RDS Security Group ---
resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "Allow PostgreSQL traffic from bastion only"
  vpc_id      = var.vpc_id

  # PostgreSQL default port, bastion only
  ingress {
    description     = "PostgreSQL from bastion"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-rds-sg"
  }
}