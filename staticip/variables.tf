variable "aws_profile" {
  description = "AWS Profile to be used for credentials"
  type        = string
  default     = "default"
}

variable "names" {
  description = "Name of the static IP"
  type        = list(string)
}

variable "region" {
  description = "AWS Region name"
  type = string
}
