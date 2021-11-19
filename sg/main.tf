resource "aws_security_group" "sg" {
  for_each    = var.sg
  name        = each.key
  description = try(each.value.description, "Rules for ${each.key}")
  vpc_id      = var.vpc_id

  dynamic "ingress" {
  for_each = {for i,ingress in each.value.ingress: i => ingress}
    content {
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = try(ingress.value.ipv6_cidr_blocks, null)
    }
  }

  dynamic "egress" {
  for_each = {for i,egress in each.value.egress: i => egress}
    content {
      description      = egress.value.description
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = try(egress.value.ipv6_cidr_blocks, null)
    }
  }

  tags = merge(var.common-tags,var.extra-tags)
}
