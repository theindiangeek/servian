variable "vpc_id" {
  description = ""
  type =  string
  default = ""
}
variable "cidr_block" {
  description = ""
  type =  string
  default = ""
}
variable "availability_zone" {
  description = ""
  type =  string
  default = ""
}
variable "availability_zone_id" {
  description = ""
  type =  string
  default = ""
}
variable "customer_owned_ipv4_pool" {
  description = ""
  type =  string
  default = ""
}
variable "ipv6_cidr_block" {
  description = ""
  type =  string
  default = null
}
variable "map_customer_owned_ip_on_launch" {
  description = ""
  type =  bool
  default = false
}
variable "map_public_ip_on_launch" {
  description = ""
  type =  bool
  default = false
}
variable "outpost_arn" {
  description = ""
  type =  string
  default = ""
}
variable "assign_ipv6_address_on_creation" {
  description = ""
  type =  bool
  default = false
}
variable "igw_id" {
  description = ""
  type =  string
  default = false
}
variable "ng_id" {
  description = ""
  type =  string
  default = false
}
variable "common-tags" {
  description = ""
  type =  map
  default = {}
}
variable "extra-tags" {
  description = ""
  type =  map
  default = {}
}
