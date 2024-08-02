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
  source             = "./modules/load_balancer"
  instance_name      = var.instance_name
  machine_type       = var.machine_type
  zone               = var.zone
  disk_image         = var.disk_image
  network            = var.network
  project_id         = var.project_id
  load_balancer_name = var.load_balancer_name
  cloud_run_service_name = basename()
}

