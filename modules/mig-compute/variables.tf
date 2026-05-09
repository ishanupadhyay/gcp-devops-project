variable "region" {
  type = string
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
  type    = string
  default = "e2-micro"
}

variable "image" {
  type    = string
  default = "debian-cloud/debian-12"
}

variable "target_size" {
  type    = number
  default = 1
}

variable "service_account_email" {
  type = string
  default = "default"
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
