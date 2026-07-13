# Module declares onepassword in required_providers; Scalr's server-side
# parser never follows this source, so it cannot see that requirement.
terraform {
  source = "git::https://github.com/v-vlasenko/tg-onepassword-external-module.git//.?ref=v1.0.1"

  # Control case: copy the lock back to the unit directory (Terragrunt default).
  copy_terraform_lock_file = true
}
