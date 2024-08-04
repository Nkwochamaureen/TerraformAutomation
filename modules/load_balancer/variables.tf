variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
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

variable "network" {
  description = "The network to attach the VM"
  type        = string
}
