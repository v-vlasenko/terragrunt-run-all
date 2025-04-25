# Configure Terragrunt to automatically store tfstate files in an S3 bucket
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  backend "s3" {}
}
EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-state-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-ssh-table"
  }
}

# Configure root level variables that all environments can inherit
locals {
  # Add common variables here
} 