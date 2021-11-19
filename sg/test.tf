#resource "null_resource" "test" {
#  for_each = var.sg["public-access-80-443"].ingress[*]
#  provisioner "local-exec" {
#    #command = "echo ${each.key}:${each.value.ingress} > /tmp/temp"
#    command = "echo ${each.key} >> /tmp/temp; echo ${each.value.from_port} >> /tmp/temp;"
#  }
#}

#output "testkey" {
#  for_each = var.sg
#  value = each.key
#}

#output "testval" {
#  for_each = var.sg
#  value = each.value
#}

#output "test" {
#  value = var.sg
#}
