resource "kubernetes_service_account" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "monitoring"
  }
}

