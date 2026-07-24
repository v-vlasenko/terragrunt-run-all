terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ssm_parameter" "plain" {
  name  = "/scalrcore-39172/plain-marker"
  type  = "String"
  value = "plain"
}
