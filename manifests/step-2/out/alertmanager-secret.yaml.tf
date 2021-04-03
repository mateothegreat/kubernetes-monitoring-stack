resource "kubernetes_secret" "alertmanager_main" {
  metadata {
    name      = "alertmanager-main"
    namespace = "monitoring"
  }

  string_datum {}

  type = "Opaque"
}

