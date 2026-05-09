module "network" {
  source       = "../../modules/network"
  network_name = "dev-vpc"
  region       = var.region
}

module "compute" {
  source  = "../../modules/compute"
  name    = "dev-vm"
  zone    = var.zone
  network = module.network.vpc_id
  subnet  = module.network.subnet_id
}

module "mig_compute" {
  source       = "../../modules/mig-compute"
  region       = var.region
  network      = module.network.vpc_id
  subnet       = module.network.subnet_id
}

module "load_balancer" {
  source = "../../modules/load-balancer"
  instance_group = module.mig_compute.instance_group
  project_id = var.project_id
}

module "dns" {
  source = "../../modules/dns"
  domain_name = var.domain_name
  dns_name = var.dns_name
  load_balancer_ip = module.load_balancer.ip_address
}

output "vpc_id" {
  value       = module.network.vpc_id
  description = "VPC ID"
}

output "subnet_id" {
  value       = module.network.subnet_id
  description = "Subnet ID"
}

output "instance_id" {
  value       = module.compute.instance_id
  description = "Compute instance ID"
}

output "instance_name" {
  value       = module.compute.instance_name
  description = "Compute instance name"
}

output "instance_group" {
  value = module.mig_compute.instance_group
  description = "MIG name"
}

output "load_balancer_ip" {
  value = module.load_balancer.ip_address
  description = "Load balancer IP address"
}
