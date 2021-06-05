# ########
# Provider
# ########

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

# #########
# terraform
# #########

# rest of the backend part will be filled by terragrunt
terraform {
  backend "s3" {}
}

###########
# STATIC IP
###########
resource "aws_lightsail_static_ip" "this" {
  count = length(var.names)
  name  = var.names[count.index]
}