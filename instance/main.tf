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

########
# LOCALS
########



######
# DATA
######

# Declare the data source
data "aws_availability_zones" "this" {
  state = "available"
}

resource "random_shuffle" "az" {
  input        = data.aws_availability_zones.this.names
  result_count = 1
}

#############
# MASTER NODE
#############

resource "aws_lightsail_instance" "this" {
  availability_zone = random_shuffle.az.result[0]
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  name              = var.instance_name
  key_pair_name     = var.key_pair_name
}

resource "aws_lightsail_static_ip_attachment" "this" {
  count         = length(var.static_ip_name) >= 1 ? 1 : 0
  instance_name = aws_lightsail_instance.this.name
  static_ip_name = var.static_ip_name
}