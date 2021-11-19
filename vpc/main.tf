resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = try(var.enable_dns_hostnames, true)
  enable_dns_support   = try(var.enable_dns_support,true)
  instance_tenancy = try(var.instance_tenancy, null)
  enable_classiclink = try(var.enable_classiclink_dns_support, null)
  enable_classiclink_dns_support = try(var.enable_classiclink_dns_support, null)
  assign_generated_ipv6_cidr_block = try(var.assign_generated_ipv6_cidr_block, null)
  tags = merge(var.common-tags,var.extra-tags)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}
