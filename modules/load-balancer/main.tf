# Reserve global public IP
resource "google_compute_global_address" "lb_ip" {
  name = "web-lb-ip"
}

# Health check
resource "google_compute_health_check" "http" {
  name = "web-health-check"

  http_health_check {
    port = 80
  }
}

# Backend service (similar to AWS Target Group)
resource "google_compute_backend_service" "backend" {
  name                  = "web-backend-service"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec           = 10

  health_checks = [
    google_compute_health_check.http.id
  ]

  backend {
    group = var.instance_group
  }
}

# URL map (similar to listener rules)
resource "google_compute_url_map" "url_map" {
  name            = "web-url-map"
  default_service = google_compute_backend_service.backend.id
}

# HTTP proxy
resource "google_compute_target_http_proxy" "proxy" {
  name    = "web-http-proxy"
  url_map = google_compute_url_map.url_map.id
}

# Global forwarding rule (entry point)
resource "google_compute_global_forwarding_rule" "http" {
  name                  = "web-forwarding-rule"
  target                = google_compute_target_http_proxy.proxy.id
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL_MANAGED"

  ip_address = google_compute_global_address.lb_ip.address
}
