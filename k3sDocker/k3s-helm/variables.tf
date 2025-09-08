variable "kubeconfig" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "/tmp/rancher/k3s/kubeconfig"
}

variable "namespace" {
  description = "Namespace where Applications will be deployed"
  type        = string
  default     = "applications"
}

variable "argocd_helm_chart_version" {
  description = "Version of the Argo CD Helm chart"
  type        = string
  default     = "8.3.5"
}

variable "argocd_helm_repo_url" {
  description = "URL of the Helm repository for Argo CD"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "argocd_http_port" {
  type    = number
  default = 30080
}

variable "argocd_https_port" {
  type    = number
  default = 30443
}

variable "redis_helm_chart_version" {
  description = "Version of the Redis Helm chart"
  type        = string
  default     = "22.0.7"
}

variable "redis_helm_repo_url" {
  description = "Redis Helm repo URL"
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
}

variable "redis_values" {
  description = "Custom values for Redis"
  type        = map(any)
  default = {
    auth = {
      enabled = false
    }
  }
}
