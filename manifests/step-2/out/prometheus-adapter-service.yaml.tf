resource "kubernetes_service" "prometheus_adapter" {
  metadata {
    name      = "prometheus-adapter"
    namespace = "monitoring"

    labels = {
      name = "prometheus-adapter"
    }
  }

  spec {
    port {
      name        = "https"
      port        = 443
      target_port = "6443"
    }

    selector = {
      name = "prometheus-adapter"
    }
  }
}

