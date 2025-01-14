variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "zone" {
  description = "The zone to deploy the VM"
  type        = string
}


variable "domain_name" {
  description = "The domain name for the managed SSL certificate"
  type        = string
}

variable "network" {
  description = "The network to attach to the instance"
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

 
variable "cloud_run_service_name" {
   description = "The cloud run name"
  type        = string
}


