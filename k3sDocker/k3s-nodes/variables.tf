variable "k3s_token" {
  description = "Token to be used by worker node to register"
  type        = string
  default     = "dads311233ddsklj12kpqlnnbccb0-"
}
variable "control_plane_name" {
  description = "Defines the name for the control plane node"
  type        = string
}

variable "control_plane_image" {
  description = "Defines the image to be used for control plane the node"
  type        = string
}

variable "control_plane_cpu_count" {
  description = "Defines number of CPU threads for the control plane node"
  type        = number
  default     = 1.5
}

variable "control_plane_mem_mb" {
  description = "Defines memory for the control plane node"
  type        = number
  default     = 1024
}

variable "worker_node_count" {
  description = "Defines number of worker nodes to be deployed"
  type        = number
  default     = 1
}

variable "worker_name_suffix" {
  description = "This suffix will be used followed by node count"
  type        = string
  default     = "k3s-worker"
}

variable "worker_image" {
  description = "Defines the image to be used for control plane the node"
  type        = string
}

variable "worker_cpu_count" {
  description = "Defines number of CPU threads for the control plane node"
  type        = string
  default     = "2"
}

variable "worker_mem_mb" {
  description = "Defines memory for the control plane node"
  type        = number
  default     = 1024
}

variable "vpc_name" {
  description = "Name used for docker network"
  type        = string
}

variable "node_subnet_cidr" {
  description = "Defines CIDR range to be used for nodes"
  type        = string
}

variable "pods_subnet_cidr" {
  description = "Defines CIDR range for pods in k3s"
  type        = string
}

variable "service_subnet_cidr" {
  description = "Difines CIDR range for services in k3s"
  type        = string
}
