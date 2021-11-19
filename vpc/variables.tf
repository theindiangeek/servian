variable "vpc_cidr" {
  description = "The CIDR to be used for the VPC"
  type = string
  default = ""
}

variable "enable_dns_hostnames" {
  description = ""
  type = bool
  default = true
}
variable "enable_dns_support" {
  description = ""
  type = bool
  default = true
}
variable "instance_tenancy" {
  description = ""
  type = string
  default = null
}
variable "enable_classiclink_dns_support" {
  description = ""
  type = bool
  default = false
}
variable "assign_generated_ipv6_cidr_block" {
  description = ""
  type = bool
  default = false
}

variable "common-tags" {
  description = "Common tags for this VPC"
  type = map
  default = {}
}

variable "extra-tags" {
  description = "Extra tags for this VPC"
  type = map
  default = {}
}
