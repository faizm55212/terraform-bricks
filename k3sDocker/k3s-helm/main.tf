resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_namespace" "application" {
  metadata {
    name = var.namespace
  }
}

# ArgoCD Helm Release
resource "helm_release" "argocd" {
  depends_on       = [kubernetes_namespace.argocd]
  name             = "argocd"
  namespace        = "argocd"
  chart            = "argo-cd"
  version          = var.argocd_helm_chart_version
  repository       = var.argocd_helm_repo_url
  create_namespace = false
  values = [
    yamlencode({
      server = {
        service = {
          type          = "NodePort"
          nodePortHttp  = var.argocd_http_port
          nodePortHttps = var.argocd_https_port
        }
      }
    })
  ]
}

# Redis Helm Release
resource "helm_release" "redis" {
  depends_on       = [kubernetes_namespace.application]
  name             = "redis"
  namespace        = var.namespace
  chart            = "redis"
  version          = var.redis_helm_chart_version
  repository       = var.redis_helm_repo_url
  create_namespace = false
  values = [
    yamlencode(var.redis_values)
  ]
}
