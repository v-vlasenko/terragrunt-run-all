# --- Dynamic default_tags in the provider block, resolved from variables ---
# This mirrors the customer config from SCALRCORE-39172:
#   provider "aws" { default_tags { tags = merge(var.tags, {...}) } }

variable "tags" {
  type = map(string)
  default = {
    Team      = "aqa"
    ManagedBy = "terragrunt"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = merge(
      var.tags,
      {
        Unit = "vpc"
      }
    )
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
