generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents = <<BEOF
terraform {
  backend "local" {}
}
BEOF
}
