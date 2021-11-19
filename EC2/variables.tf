variable "ec2-instance" {
  description = ""
  default = {}
  type = any
  #type = object({
  #  amiID = string
  #  subnet_id = string
  #  instanceType = string
  #  key_name = optional(string)
  #  common-tags = optional(map(string))
  #})
}
variable "amiID" {
  description = "The AMI ID of the instance"
  default = ""
  type = string
}
variable "instanceType" {
  description = "The instance type t2.micro, m4.large"
  default = ""
  type = string
}
variable "subnet_id" {
  description = "The subnet to launch the instance in"
  default = ""
  type = string
}
variable "key_name" {
  description = "The pem encoded file on AWS to be used for the instance"
  default = ""
  type = string
}
variable "associate_public_ip_address" {
  default = false
  type = bool
}
variable "common-tags" {
  description = "Common tags to be used for the resource"
  default = {}
  type = map
}
variable "extra-tags" {
  description = "Any extra tags to be used apart from the common tags"
  default = {}
  type = map
}
