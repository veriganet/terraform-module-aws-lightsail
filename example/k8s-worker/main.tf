provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "local" {}
}

module "k8s-worker-test01" {
  source = "../../k8s-worker"

  region = "eu-west-1"
  instance_count = "2"
  bundle_id = "medium_2_0"
  blueprint_id = "debian_10"
  cluster = "test001"
  key_pair_name = "zer"
}

