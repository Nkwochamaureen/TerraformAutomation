resource "google_compute_global_address" "default" {
  name = "global-ip"
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_https_proxy" "default" {
  name        = "https-proxy"
  url_map     = google_compute_url_map.default.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.default.self_link]
}

resource "google_compute_global_forwarding_rule" "default" {
  name        = "https-forwarding-rule"
  target      = google_compute_target_https_proxy.default.self_link
  port_range  = "443"
  ip_address  = google_compute_global_address.default.address
}

resource "google_compute_managed_ssl_certificate" "default" {
  name = "ssl-cert"
  managed {
    domains = ["terraform.example.com"]
  }
}
