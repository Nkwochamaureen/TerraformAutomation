resource "google_compute_global_address" "default" {
  name = "global-ip"
}

resource "google_compute_url_map" "default" {
  name = "url-map"
  
  default_url_redirect {
    https_redirect = true
    strip_query = false
  }

  host_rule {
    hosts        = ["terraform.example.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.default.self_link
  }
}

resource "google_compute_backend_service" "default" {
  name                  = "backend-service"
  protocol              = "HTTPS"
  timeout_sec           = 30
  connection_draining_timeout_sec = 30
  
  health_checks         = [google_compute_https_health_check.default.self_link]

  backend {
    group = google_compute_instance_group.default.self_link
  }
}


resource "google_compute_https_health_check" "default" {
  name                = "https-health-check"
  request_path        = "/"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}

resource "google_compute_target_https_proxy" "default" {
  name             = "https-proxy"
  url_map          = google_compute_url_map.default.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.default.self_link]
}

resource "google_compute_global_forwarding_rule" "https" {
  name       = "https-forwarding-rule"
  target     = google_compute_target_https_proxy.default.self_link
  port_range = "443"
  ip_address = google_compute_global_address.default.address
}

resource "google_compute_target_http_proxy" "default" {
  name    = "http-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "http" {
  name       = "http-forwarding-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
  ip_address = google_compute_global_address.default.address
} 


resource "google_compute_managed_ssl_certificate" "default" {
  name = "ssl-cert"
  managed {
    domains = ["terraform.example.com"]
  }
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network =  var.network
    access_config {}
  }
}


resource "google_compute_instance_group" "default" {
  name = "instance-group"
  zone = var.zone
  instances = [
    google_compute_instance.vm_instance.self_link,  
 ]
 named_port {
    name = "http"
    port = "80"
  }

  named_port {
    name = "https"
    port = "443"
  }

}



 resource "google_compute_instance_group_manager" "default" {
   name = "instance-group-manager"

   base_instance_name = "instance"
   zone               = var.zone

   version {
     instance_template  = google_compute_instance_template.default.self_link
    
   }

 }
 resource "google_compute_instance_template" "default" {
  name         = "instance-template"
  machine_type = "e2-micro"

  disk {
    source_image = var.disk_image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network =  var.network
    access_config {}
  }

  metadata = {
    gcp-container-declaration = <<EOF
spec:
  containers:
    - name: terraform-docs
      image: mirror.gcr.io/nkwocha1234/terraform-docs@sha256:7d3214973df417e5999721b5d4c2b97b0e4dd42682646d4684e2ee38f3f98a5b
      ports:
        - containerPort: 8080
EOF
  }

  service_account {
    email = "768473134994-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-https" {
  name    = "allow-https"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
