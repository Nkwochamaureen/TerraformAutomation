output "load_balancer_ip" {
  value = google_compute_global_address.default.address
}

output "instance_id" {
  value = google_compute_instance.vm_instance.id
}

output "instance_self_link" {
  value = google_compute_instance.vm_instance.self_link
}

output "global_ip" {
  value = google_compute_global_address.default.address
}



output "backend_service" {
  value = google_compute_backend_service.default.self_link
}
