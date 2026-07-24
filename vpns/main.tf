# --- Dynamic default_tags built from a dependency output (the exact shape
#     described in SCALRCORE-39172): merge(var.tags, {VpcParamArn = var.vpc_param_arn}) ---

variable "tags" {
  type = map(string)
  default = {
    Team      = "aqa"
    ManagedBy = "terragrunt"
  }
}

variable "vpc_param_arn" {
  type = string
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = merge(
      var.tags,
      {
        Unit        = "vpns"
        VpcParamArn = var.vpc_param_arn
      }
    )
  }
}

resource "aws_ssm_parameter" "vpns" {
  name        = "/scalrcore-39172/vpns-marker"
  type        = "String"
  value       = "vpns"
  description = "depends on ${var.vpc_param_arn}"
}
