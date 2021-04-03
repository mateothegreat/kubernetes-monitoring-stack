resource "kubernetes_role" "prometheus_k_8_s_config" {
  metadata {
    name      = "prometheus-k8s-config"
    namespace = "monitoring"
  }

  rule {
    verbs      = ["get"]
    api_groups = [""]
    resources  = ["configmaps"]
  }
}

