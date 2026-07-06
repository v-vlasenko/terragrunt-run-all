include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::https://github.com/v-vlasenko/terragrunt-run-all.git//module-onepassword?ref=SCALRCORE-39086-custom-provider-repro"
}
