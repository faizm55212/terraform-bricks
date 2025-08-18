variable "vpc_name" {
  description  = "Defines the name for docker network"
  type         = string
  default      = "k3s-vnet"
}

variable "ipam_config" {
  description  = "Defines the vpc cidr and gateway address for the docker network"
  type         = list(object({
    subnet     = string
    gateway    = string
    ip_range   = string
  }))
  default      = [
    {
      subnet   = "162.172.0.0/24"
      gateway  = ""
      ip_range = ""
    }
  ]
}

variable "labels" {
  description  = "Labels to be attached to created vnet"
  type         = list(object({
    label      = string
    value      = string
  }))
  default      = [
    {
      label    = "project"
      value    = "k3s-lab"
    },
    {
      label    = "type"
      value    = "internal"
    }
  ]
}

variable "pods_subnet_cidr" {
  description  = "Defines CIDR range for pods"
  type         = string
  default      = ""
}

variable "service_subnet_cidr"{
  description  = "Defines CIDR range for services"
  type         = string
  default      = ""
}
