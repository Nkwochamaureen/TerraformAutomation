output "cloud_run_url" {
  value = google_cloud_run_service.default.status[0].url
}

output "load_balancer_ip" {
  value = google_compute_global_address.default.address
}

output "instance_id" {
  value = google_compute_instance.vm_instance.id
}

output "instance_self_link" {
  value = google_compute_instance.vm_instance.self_link
}