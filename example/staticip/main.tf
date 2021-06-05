provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "local" {}
}

module "staticip" {
  source = "../../staticip"

  region = "eu-west-1"
  names = [
    "k8s0-master0",
    "k8s0-master1",
    "k8s0-master2"
  ]
}