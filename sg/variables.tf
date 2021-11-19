variable "common-tags" {
  description = ""
  default = {}
  type = map
}
variable "extra-tags" {
  description = ""
  default = {}
  type = map
}
variable "sg" {
  description = ""
  default = {}
  type = map
}
variable "vpc_id" {
  description = ""
  default = ""
  type = string
}
