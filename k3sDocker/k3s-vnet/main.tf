resource "docker_network" "local_network" {
  name                  = var.vpc_name
  driver                = "bridge"
  dynamic "ipam_config" {
    for_each            = var.ipam_config
    content {
      subnet            = ipam_config.value.subnet
      gateway           = ipam_config.value.gateway != "" ? ipam_config.value.gateway : null
      ip_range          = ipam_config.value.ip_range != "" ? ipam_config.value.ip_range : null
    }
  }
  dynamic "labels" {
    for_each           = var.labels
    content {
      label            = labels.value.label
      value            = labels.value.value
    }
  }
}

