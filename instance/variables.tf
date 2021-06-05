variable "aws_availability_zones" {
  # list of availabiliry zones:
  # https://www.terraform.io/docs/providers/aws/r/lightsail_instance.html#availability-zones
  description = "(Required) The Availability Zone in which to create your instance (see list below)"
  type        = list
  default     = []
}

variable "aws_profile" {
  description = "AWS Profile to be used for credentials"
  type        = string
  default     = "default"
}

variable "blueprint_id" {
  # list of supported blueprint_id(s):
  # https://www.terraform.io/docs/providers/aws/r/lightsail_instance.html#blueprints
  description = "(Required) The ID for a virtual private server image"
  default     = "debilan_10"
}

variable "bundle_id" {
  # list of supported bundle_id(s):
  # https://www.terraform.io/docs/providers/aws/r/lightsail_instance.html#bundles
  description = "(Required) The bundle of specification information (see list below)."
}

variable "key_pair_name" {
  description = "(Optional) The name of your key pair. Created in the Lightsail console (cannot use aws_key_pair at this time)"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "region" {
  description = "AWS Region name"
  type = string
}

variable "ports_to_open" {
  description = "Which ports to be opened to world"
  type        = list
  default     = ["80", "443"]
}

variable "static_ip_name" {
  description = "List of static IP names to be attached to instance"
  type        = string
  default     = ""
}