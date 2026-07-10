# Global inputs propagated to every unit. Mirrors the customer's "core" object
# passed to all units - Terragrunt writes it to terraform.tfvars.json, and the
# unit's module does not declare it, producing the "Value for undeclared
# variable" warning seen in the customer's plan output.
#
# Backend is intentionally NOT configured here: Scalr injects its own remote
# backend via scalr_override.tf.json, same as on the customer's runners.
inputs = {
  core = {
    environment = "repro"
  }
}
