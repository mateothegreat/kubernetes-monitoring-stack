resource "kubernetes_service" "prometheus_operator" {
  metadata {
    name      = "prometheus-operator"
    namespace = "monitoring"

    labels = {
      "app.kubernetes.io/component" = "controller"

      "app.kubernetes.io/name" = "prometheus-operator"

      "app.kubernetes.io/version" = "v0.42.1"
    }
  }

  spec {
    port {
      name        = "https"
      port        = 8443
      target_port = "https"
    }

    selector = {
      "app.kubernetes.io/component" = "controller"

      "app.kubernetes.io/name" = "prometheus-operator"
    }

    cluster_ip = "None"
  }
}

