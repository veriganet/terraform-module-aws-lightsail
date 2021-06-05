provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "local" {}
}

module "k8s-master-test01" {
  source = "../../k8s-master"

  region = "eu-west-1"
  instance_count = "3"
  bundle_id = "medium_2_0"
  blueprint_id = "debian_10"
  cluster = "test001"
  key_pair_name = "zer"
  static_ip_names = [
    "k8s0-master0",
    "k8s0-master1",
    "k8s0-master2"
  ]
}

