provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source      = "./modules/network"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
  region       = var.region
}

module "load_balancer" {
  source               = "./modules/load_balancer"
  zone                 = var.zone
  network              = var.network
  project_id           = var.project_id
  load_balancer_name   = var.load_balancer_name
  cloud_run_service_name = var.cloud_run_service_name
  
}
