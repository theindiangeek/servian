resource "aws_instance" "vm" {
  for_each = var.ec2-instance
  ami           = each.value.amiID
  instance_type = each.value.instanceType
  subnet_id = each.value.subnet_id
  security_groups = try(each.value.security_groups, null)
  #public_ip = lookup(aws_eip.eip.*.id,0)
  key_name = each.value.key_name
  tags = merge(try(each.value.common-tags, {}), try(each.value.extra-tags, {}))
  user_data = try(each.value.user_data, null)
  dynamic "root_block_device" {
    for_each = try(each.value.root_block_device, [])
    content {
      delete_on_termination = try(root_block_device.value.delete_on_termination, null)
      encrypted = try(root_block_device.value.encrypted, null)
      iops = try(root_block_device.value.iops, null)
      kms_key_id = try(root_block_device.value.kms_key_id, null)
      tags = try(root_block_device.value.tags, null)
      throughput = try(root_block_device.value.throughput, null)
      volume_size = try(root_block_device.value.volume_size, null)
      volume_type = try(root_block_device.value.volume_type, null)
    }
  }
  lifecycle { 
    #ignore_changes = [tags]
    ignore_changes = [ami]
  }
}

resource "aws_eip" "eip" {
  for_each = {for map in local.eip-instance-map: map.instance => map}
  instance = aws_instance.vm[each.value.instance].id
  vpc      = true
}

locals {
  eip-instance-map = flatten([
    for inst_key, inst in var.ec2-instance : [
      for allow in try([inst.associate_public_ip_address], []) : {
        instance = inst_key
        allow    = allow
      }
    ]
  ])
}
