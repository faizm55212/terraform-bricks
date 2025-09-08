resource "docker_container" "k3s-control-plane" {
  name  = var.control_plane_name
  image = var.control_plane_image
  #cpus       = var.control_plane_cpu_count
  memory     = var.control_plane_mem_mb
  restart    = "unless-stopped"
  privileged = true
  ports {
    internal = "6443"
    external = "6443"
  }
  volumes {
    host_path      = "/tmp/rancher/k3s"
    container_path = "/etc/rancher/k3s"
  }
  networks_advanced {
    name         = var.vpc_name
    ipv4_address = cidrhost(var.node_subnet_cidr, 1)
  }
  env = [
    "K3S_TOKEN=${var.k3s_token}"
  ]
  command = [
    "server",
    "--cluster-init",
    "--cluster-cidr", var.pods_subnet_cidr,
    "--service-cidr", var.service_subnet_cidr,
    "--tls-san", cidrhost(var.node_subnet_cidr, 1),
    "--bind-address", cidrhost(var.node_subnet_cidr, 1),
    "--snapshotter", "native",
    "--write-kubeconfig", "/etc/rancher/k3s/kubeconfig",
    "--write-kubeconfig-mode", "644",
    "--disable=traefik"
  ]

}

resource "docker_container" "k3s-worker-node" {
  count = var.worker_node_count
  name  = "${var.worker_name_suffix}-${count.index + 1}"
  image = var.worker_image
  #cpus       = var.worker_cpu_count
  memory     = var.worker_mem_mb
  restart    = "unless-stopped"
  privileged = true
  networks_advanced {
    name         = var.vpc_name
    ipv4_address = cidrhost(var.node_subnet_cidr, count.index + 2)
  }
  env = [
    "K3S_TOKEN=${var.k3s_token}"
  ]
  command = [
    "agent",
    "--server", "https://${cidrhost(var.node_subnet_cidr, 1)}:6443", # The IP of the control plane
  ]
}
