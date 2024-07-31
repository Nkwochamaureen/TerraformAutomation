output "instance_id" {
  value = google_compute_instance.vm_instance.id
}

output "instance_self_link" {
  value = google_compute_instance.vm_instance.self_link
}
