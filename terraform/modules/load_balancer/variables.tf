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




variable "zone" {
  description = "The zone to deploy the VM"
  type        = string
}



variable "network" {
  description = "The network to attach the VM"
  type        = string
}

variable "cloud_run_service_name" {
   description = "The cloud run name"
  type        = string
}
  