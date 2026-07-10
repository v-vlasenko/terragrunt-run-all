include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Module sourced from the Scalr module registry via tfr:// - mirrors the customer's
# unit sourcing tfr://everyonetv.scalr.io/scalr/resources/scalr?version=0.806.1
# The onepassword required_providers lives in the registry module, invisible to
# Scalr's configuration-version parser.
terraform {
  source = "tfr://vlad2910.main.scalr.dev/aaa/repro/onepassword?version=9.9.1"
}
