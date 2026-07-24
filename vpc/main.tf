# Provider block WITHOUT default_tags. Default tags come solely from the
# Scalr provider configuration (managedBy=scalr.io) via its override.

provider "aws" {
  region = "us-east-1"
}

resource "aws_ssm_parameter" "vpc" {
  name  = "/scalrcore-39172/vpc-marker"
  type  = "String"
  value = "vpc"
}

output "vpc_param_arn" {
  value = aws_ssm_parameter.vpc.arn
}
