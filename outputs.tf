output "network_id" {
  value = module.network.network_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "global_ip" {
  value = google_compute_global_address.default.address
}

output "url_map" {
  value = google_compute_url_map.default.self_link
}

output "backend_service" {
  value = google_compute_backend_service.default.self_link
}

