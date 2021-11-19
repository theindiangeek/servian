#output "id" {
#  value = aws_instance.vm.id
#}

#output "arn" {
#  value = aws_instance.vm.arn
#}

#output "privateIP" {
#  value = aws_instance.vm.private_ip
#}

output "vm" {
  value = aws_instance.vm
}
