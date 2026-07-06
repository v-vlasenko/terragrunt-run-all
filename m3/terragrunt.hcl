include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::https://github.com/v-vlasenko/tg-onepassword-external-module.git//?ref=main"
}
