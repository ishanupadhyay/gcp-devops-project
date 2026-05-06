output "instance_id" {
  description = "ID of the created instance"
  value       = google_compute_instance.vm.id
}

output "instance_name" {
  description = "Name of the created instance"
  value       = google_compute_instance.vm.name
}
