variable "vpc_param_arn" {
  type = string
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Unit    = "vpns"
      OwnedBy = "config-static"
    }
  }
}

resource "aws_ssm_parameter" "vpns" {
  name        = "/scalrcore-39172/vpns-marker"
  type        = "String"
  value       = "vpns"
  description = "depends on ${var.vpc_param_arn}"
}
