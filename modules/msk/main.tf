resource "aws_msk_serverless_cluster" "main" {
  cluster_name = "${var.project_name}-msk-cluster"

  vpc_config {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [var.msk_sg_id]
  }

  client_authentication {
    sasl {
      iam {
        enabled = true  # IAM auth only — no passwords, no plaintext
      }
    }
  }

  tags = {
    Name = "${var.project_name}-msk-cluster"
  }
}