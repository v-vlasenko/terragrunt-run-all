include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  vpc_param_arn = "arn:aws:ssm:us-east-1:971604682574:parameter/cloud-4527-repro/vpc-marker"
}
