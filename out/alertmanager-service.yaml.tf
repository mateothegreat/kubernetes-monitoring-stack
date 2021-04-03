resource "kubernetes_service" "alertmanager_main" {
  metadata {
    name      = "alertmanager-main"
    namespace = "monitoring"

    labels = {
      alertmanager = "main"
    }
  }

  spec {
    port {
      name        = "web"
      port        = 9093
      target_port = "web"
    }

    selector = {
      alertmanager = "main"

      app = "alertmanager"
    }

    session_affinity = "ClientIP"
  }
}

