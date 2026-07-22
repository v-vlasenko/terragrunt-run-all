terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {}

data "kubernetes_namespace" "x" {
  metadata {
    name = "default"
  }
}
