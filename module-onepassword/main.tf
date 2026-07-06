terraform {
  required_providers {
    onepassword = {
      source  = "1Password/onepassword"
      version = "~> 2.0"
    }
  }
}

data "onepassword_vault" "repro" {
  name = "scalrcore-39086-repro"
}
