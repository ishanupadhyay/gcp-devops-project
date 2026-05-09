variable "network_name" {
  type        = string
  description = "VPC network name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
  default     = "dev-subnet"
}


variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR range"
  default     = "10.0.1.0/24"
}

variable "region" {
  type        = string
  description = "Region for the subnetwork"
}
