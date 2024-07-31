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
