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
  instance_group = module.mig.instance_group
  project_id = var.project_id
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
