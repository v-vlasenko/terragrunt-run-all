# Provider block WITHOUT default_tags. Default tags come solely from the
# Scalr provider configuration (managedBy=scalr.io) via its override.

variable "vpc_param_arn" {
  type = string
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ssm_parameter" "vpns" {
  name        = "/scalrcore-39172/vpns-marker"
  type        = "String"
  value       = "vpns"
  description = "depends on ${var.vpc_param_arn}"
}
