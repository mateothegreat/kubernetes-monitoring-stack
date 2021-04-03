resource "kubernetes_service_account" "alertmanager_main" {
  metadata {
    name      = "alertmanager-main"
    namespace = "monitoring"
  }
}

