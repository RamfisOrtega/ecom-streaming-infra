# --- Trust Policy: allows EC2 to assume this role ---
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# --- IAM Role for Bastion EC2 ---
resource "aws_iam_role" "bastion" {
  name               = "${var.project_name}-bastion-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name = "${var.project_name}-bastion-role"
  }
}

# --- SSM Session Manager: connect from AWS Console UI ---
resource "aws_iam_role_policy_attachment" "bastion_ssm" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# --- MSK Policy: produce, consume, describe, create topics ---
data "aws_iam_policy_document" "bastion_msk" {
  # Cluster-level permissions (describe, get bootstrap brokers)
  statement {
    sid = "MSKClusterPermissions"
    actions = [
      "kafka-cluster:Connect",
      "kafka-cluster:DescribeCluster",
    ]
    resources = [var.msk_cluster_arn]
  }

  # Topic-level permissions (create, produce, consume)
  statement {
    sid = "MSKTopicPermissions"
    actions = [
      "kafka-cluster:CreateTopic",
      "kafka-cluster:DescribeTopic",
      "kafka-cluster:WriteData",
      "kafka-cluster:ReadData",
    ]
    resources = ["${var.msk_cluster_arn}/*"]
  }

  # Consumer group permissions (needed for consuming messages)
  statement {
    sid = "MSKGroupPermissions"
    actions = [
      "kafka-cluster:AlterGroup",
      "kafka-cluster:DescribeGroup",
    ]
    resources = ["${var.msk_cluster_arn}/*"]
  }
}

resource "aws_iam_policy" "bastion_msk" {
  name   = "${var.project_name}-bastion-msk-policy"
  policy = data.aws_iam_policy_document.bastion_msk.json
}

resource "aws_iam_role_policy_attachment" "bastion_msk" {
  role       = aws_iam_role.bastion.name
  policy_arn = aws_iam_policy.bastion_msk.arn
}

# --- Instance Profile: attaches the role to EC2 ---
resource "aws_iam_instance_profile" "bastion" {
  name = "${var.project_name}-bastion-profile"
  role = aws_iam_role.bastion.name
}