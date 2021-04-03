resource "kubernetes_service_account" "prometheus_k_8_s" {
  metadata {
    name      = "prometheus-k8s"
    namespace = "monitoring"
  }
}

