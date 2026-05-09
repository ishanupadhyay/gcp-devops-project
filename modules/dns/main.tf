resource "google_dns_managed_zone" "zone" {
  name        = "devops-zone"
  dns_name    = "${var.domain_name}."
  description = "Cloud DNS zone"
}

resource "google_dns_record_set" "app" {
  name = "app.${var.domain_name}."
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.zone.name

  rrdatas = [var.load_balancer_ip]
}
