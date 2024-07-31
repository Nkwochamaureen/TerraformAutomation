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

module "compute" {
  source        = "./modules/compute"
  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  disk_image    = var.disk_image
  network       = module.network.network_id
}
