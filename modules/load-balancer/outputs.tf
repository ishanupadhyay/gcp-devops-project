output "name" {
  description = "Load balancer name"
  value = google_compute_global_address.lb_ip
}

output "ip_address" {
  description = "Load balancer IP address"
  value = google_compute_global_address.lb_ip.address
}
