resource "aws_msk_cluster" "main" {
  cluster_name           = "${var.project_name}-${var.environment}-msk-cluster"
  kafka_version          = "3.6.0"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type   = "kafka.t3.small"
    client_subnets  = var.private_subnet_ids
    security_groups = [var.msk_sg_id]

    storage_info {
      ebs_storage_info {
        volume_size = 10
      }
    }
  }

  client_authentication {
    sasl {
      iam = true
    }
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
      in_cluster    = true
    }
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-msk-cluster"
  }
}