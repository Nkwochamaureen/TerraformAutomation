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

variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The type of machine"
  type        = string
}

variable "zone" {
  description = "The zone to deploy the VM"
  type        = string
}

variable "disk_image" {
  description = "The image for the boot disk"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the managed SSL certificate"
  type        = string
}

variable "instance_group" {
  description = "The instance group to attach to the backend service"
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

 

  
 