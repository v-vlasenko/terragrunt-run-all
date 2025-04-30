terraform {
  source = "git::ssh://git@github.com/v-vlasenko/terraform-scalr-submod?ref=3.2.6.git"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders("root.hcl")
}

# Configure any required variables or inputs here
inputs = {
  # Add your input variables here
} 
