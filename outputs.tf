output "network_id" {
  value = module.network.network_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "instance_self_link" {
  value = module.compute.instance_self_link
}
