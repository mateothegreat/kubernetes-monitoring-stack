resource "kubernetes_service_account" "prometheus_adapter" {
  metadata {
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }
}

