variable "zone" {
  type = string
}
// Root environment variables required by environments/dev providers.tf and main.tf.

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "domain_name" {
  type = string
}

variable "dns_name" {
  type = string
}

variable "load_balancer_ip" {
  type = string
}
