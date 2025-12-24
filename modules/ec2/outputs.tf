output "private_ips" {
  value = { for k, inst in aws_instance.server : k => inst.private_ip }
}

output "instance_ids_map" {
  value = { for k, v in aws_instance.server : k => v.id }
}
