output "network_id" {
  value = module.network.network_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "load_balancer_ip" {
  value = google_compute_global_address.static_ip.address
}
  







