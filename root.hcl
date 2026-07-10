# Global inputs propagated to every unit. Mirrors the customer's "core" object
# passed to all units - Terragrunt writes it to terraform.tfvars.json, and the
# unit's module does not declare it, producing the "Value for undeclared
# variable" warning seen in the customer's plan output.
inputs = {
  core = {
    environment = "repro"
  }
}

# The repro environment has Scalr remote state management disabled, so the
# backend must be present in the source (Scalr does not inject one). A local
# backend keeps the repro self-contained; the backend type is irrelevant to the
# provider-injection bug under test.
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "local" {}
}
EOF
}
