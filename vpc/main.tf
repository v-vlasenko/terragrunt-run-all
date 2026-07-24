# No config-level default_tags block. Provider defaults (incl. default_tags)
# come solely from the Scalr provider configuration override.

resource "aws_ssm_parameter" "vpc" {
  name  = "/scalrcore-39172/vpc-marker"
  type  = "String"
  value = "vpc"
}

output "vpc_param_arn" {
  value = aws_ssm_parameter.vpc.arn
}
