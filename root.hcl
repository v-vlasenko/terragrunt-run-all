generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOB
terraform {
  backend "s3" {}
}
EOB
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "scalr-e2e-tg-test"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-ssh-table"
  }
}
