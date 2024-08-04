output "load_balancer_ip" {
  value = google_compute_global_address.static_ip.address
}


  output "cloud_run_url" {
       value = google_cloud_run_service.default.status[0].url
     }

  
output "global-static-ip" {
  value = google_compute_global_address.static_ip.address
}



output "backend_service" {
  value = google_compute_backend_service.default.self_link
}
