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

#############
# MASTER NODE
#############

resource "aws_lightsail_instance" "this" {
  count             = var.instance_count
  availability_zone = data.aws_availability_zones.this.names[count.index]
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  name              = "${var.cluster}-master${count.index}"
  key_pair_name     = var.key_pair_name
}

resource "aws_lightsail_static_ip_attachment" "this" {
  count         = length(var.static_ip_names) >= 1 ? var.instance_count : 0
  instance_name = aws_lightsail_instance.this[count.index].name
  static_ip_name = var.static_ip_names[count.index]
}