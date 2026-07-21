variable "region" {
  default = "us-east-1"
}

resource "null_resource" "m1" {}

# Deliberately broken: unterminated HCL string, forces a genuine
# `terraform init` subprocess failure (not an HCL-eval "unknown variable"
# dependency error) so Terragrunt's run-all invocation-wrapper noise
# ("* Failed to execute ...", "N errors occurred:", "exit status N")
# actually gets emitted. Used to reproduce SCALRCORE-35961's noise-log-filter finding.
resource "null_resource" "broken" {
  triggers = {
    x = "unterminated
  }
}
