variable "name" {
  type        = string
  description = "VM name"
}

variable "zone" {
  type        = string
  description = "Zone for the VM"
}

variable "network" {
  type        = string
  description = "(Optional) network identifier"
}


variable "subnet" {
  type        = string
  description = "Subnetwork ID or name to attach the VM to"
}

variable "machine_type" {
  type        = string
  description = "Machine type"
  default     = "e2-micro"
}

variable "image" {
  type        = string
  description = "Boot disk image"
  default     = "debian-cloud/debian-12"
}

variable "boot_disk_size_gb" {
  type        = number
  description = "Boot disk size (GB)"
  default     = 10
}

variable "service_account_email" {
  type        = string
  description = "Service account email for the VM"
  default     = "default"
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key to install in instance metadata"
  default     = ""
}

variable "tags" {
  type        = list(string)
  description = "Network tags for the instance"
  default     = []
}
