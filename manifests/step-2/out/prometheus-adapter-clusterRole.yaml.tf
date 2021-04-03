resource "kubernetes_cluster_role" "prometheus_adapter" {
  metadata {
    name = "prometheus-adapter"
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = [""]
    resources  = ["nodes", "namespaces", "pods", "services"]
  }
}

