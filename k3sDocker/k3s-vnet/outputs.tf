output "network_name" {
  value = docker_network.local_network.name
}

output "node_subnet_cidr"{
  value = var.ipam_config[0].ip_range
}

output "pods_subnet_cidr" {
  value = var.pods_subnet_cidr
}

output "service_subnet_cidr" {
  value = var.service_subnet_cidr
}
