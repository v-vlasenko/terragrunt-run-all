# No config-level default_tags block. Provider defaults come solely from the
# Scalr provider configuration override.

variable "vpc_param_arn" {
  type = string
}

resource "aws_ssm_parameter" "vpns" {
  name        = "/scalrcore-39172/vpns-marker"
  type        = "String"
  value       = "vpns"
  description = "depends on ${var.vpc_param_arn}"
}
