#https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1

resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = try(var.availability_zone_id != null ? null : var.availability_zone,null)
  availability_zone_id = try(var.availability_zone != null ? null : var.availability_zone_id ,null)
  customer_owned_ipv4_pool = try(var.customer_owned_ipv4_pool,null)
  ipv6_cidr_block = try(var.ipv6_cidr_block,null)
  map_customer_owned_ip_on_launch = try(var.map_customer_owned_ip_on_launch,false)
  map_public_ip_on_launch = try(var.map_public_ip_on_launch,false)
  outpost_arn = try(var.outpost_arn,null)
  assign_ipv6_address_on_creation = try(var.assign_ipv6_address_on_creation,false)
  tags = merge(var.common-tags,var.extra-tags)
}

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id
}

#Routing table entry keeps being rebuilt
#https://github.com/hashicorp/terraform/issues/7303
resource "aws_route" "igw-route" {
  count = var.map_public_ip_on_launch ? 1 : 0
  route_table_id            = element(aws_route_table.rt.*.id, count.index)
  destination_cidr_block    = "0.0.0.0/0"
  #vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
  gateway_id = var.igw_id
}

resource "aws_route_table_association" "igw-association" {
  count = var.map_public_ip_on_launch ? 1 : 0
  subnet_id = aws_subnet.subnet.id
  #route_table_id = element(aws_route_table.rt.*.id, count.index)
  route_table_id = aws_route_table.rt.id
}

resource "aws_route" "ng-route" {
  count = try(var.map_public_ip_on_launch,0) ? 0 : 1
  route_table_id            = element(aws_route_table.rt.*.id, count.index)
  destination_cidr_block    = "0.0.0.0/0"
  #vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
  nat_gateway_id = var.ng_id
}

resource "aws_route_table_association" "ng-association" {
  count = try(var.map_public_ip_on_launch,0) ? 0 : 1
  subnet_id = aws_subnet.subnet.id
  #route_table_id = element(aws_route_table.rt.*.id, count.index)
  route_table_id = aws_route_table.rt.id
}
