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
    network = var.network
    access_config {}
  }
}


resource "google_compute_instance_group" "default" {
  name = "instance-group"
  zone = var.zone
 instances = [
    google_compute_instance.vm_instance,
  ]
  
}
resource "google_compute_instance_group_manager" "default" {
  name = "instance-group-manager"

  base_instance_name = "instance"
  zone               = var.zone

  version {
    instance_template  = google_compute_instance_template.default.self_link
  }
    target_size  = 1
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
    network = "default"
    access_config {}
  }

  metadata = {
    startup-script = "#! /bin/bash\n     sudo apt-get update\n     sudo apt-get install apache2 -y\n     sudo a2ensite default-ssl\n     sudo a2enmod ssl\n     vm_hostname=\"$(curl -H \"Metadata-Flavor:Google\" \\\n   http://169.254.169.254/computeMetadata/v1/instance/name)\"\n   sudo echo \"Page served from: $vm_hostname\" | \\\n   tee /var/www/html/index.html\n   sudo systemctl restart apache2"
  }
}
