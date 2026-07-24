provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Unit    = "vpc"
      OwnedBy = "config-static"
    }
  }
}

resource "aws_ssm_parameter" "vpc" {
  name  = "/scalrcore-39172/vpc-marker"
  type  = "String"
  value = "vpc"
}

output "vpc_param_arn" {
  value = aws_ssm_parameter.vpc.arn
}
