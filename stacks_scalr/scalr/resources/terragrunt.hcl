include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Module lives in an external repo so its required_providers (onepassword) is
# invisible to Scalr's configuration-version parser - mirrors the customer's
# unit sourcing tfr://everyonetv.scalr.io/scalr/resources/scalr?version=0.806.1
terraform {
  source = "git::https://github.com/v-vlasenko/tg-onepassword-external-module.git//?ref=main"
}
