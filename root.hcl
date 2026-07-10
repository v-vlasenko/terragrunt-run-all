# Global inputs propagated to every unit. Mirrors the customer's "core" object
# passed to all units - Terragrunt writes it to terraform.tfvars.json, and the
# unit's module does not declare it, producing the "Value for undeclared
# variable" warning seen in the customer's plan output.
inputs = {
  core = {
    environment = "repro"
  }
}

# The repro environment has Scalr remote state management disabled, so a real
# remote backend must be present in the source. S3 is authenticated by the aws
# provider configuration linked to the workspace (test-tg) plus AWS_DEFAULT_REGION.
# The backend type is irrelevant to the provider-injection bug under test.
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket  = "scalr-e2e-tg-test"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
