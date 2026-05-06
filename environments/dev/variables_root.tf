// Root environment variables required by environments/dev providers.tf and main.tf.

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region"
}



