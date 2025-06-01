terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "lb-aws-admin"
}

module "apache" {
    source  = "bigonil/apache/aws"
    version = "1.0.0"
    vpc_id          = var.vpc_id
    my_ip_with_cidr = var.my_ip_with_cidr
    public_key      = var.public_key
    instance_type   = var.instance_type
    server_name     = var.server_name
}

output "public_ip" {
  description = "Public IP of the Apache instance"
  value       = module.apache.public_ip
}