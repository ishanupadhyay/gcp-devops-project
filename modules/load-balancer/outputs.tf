output "name" {
  description = "Load balancer name"
  value = google_compute_global_address.lb_ip
}
