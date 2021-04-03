resource "kubernetes_cluster_role" "prometheus_k_8_s" {
  metadata {
    name = "prometheus-k8s"
  }

  rule {
    verbs      = ["get"]
    api_groups = [""]
    resources  = ["nodes/metrics"]
  }

  rule {
    verbs             = ["get"]
    non_resource_urls = ["/metrics"]
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = [""]
    resources  = ["services", "pods", "endpoints"]
  }
}

