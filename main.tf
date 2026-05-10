terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
}

module "security_groups" {
  source       = "./modules/security_groups"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
  my_ip        = var.my_ip
}

module "msk" {
  source             = "./modules/msk"
  project_name       = var.project_name
  private_subnet_ids = module.vpc.private_subnet_ids
  msk_sg_id          = module.security_groups.msk_sg_id
}

module "iam" {
  source           = "./modules/iam"
  project_name     = var.project_name
  msk_cluster_arn  = module.msk.cluster_arn
  msk_cluster_uuid = module.msk.cluster_uuid
  account_id       = "381491941344"
  region           = var.aws_region
}

module "ec2" {
  source                        = "./modules/ec2"
  project_name                  = var.project_name
  public_subnet_id              = module.vpc.public_subnet_ids[0]
  bastion_sg_id                 = module.security_groups.bastion_sg_id
  bastion_instance_profile_name = module.iam.bastion_instance_profile_name
}