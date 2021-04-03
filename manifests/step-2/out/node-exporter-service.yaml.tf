resource "kubernetes_service" "node_exporter" {
  metadata {
    name      = "node-exporter"
    namespace = "monitoring"

    labels = {
      "app.kubernetes.io/name" = "node-exporter"

      "app.kubernetes.io/version" = "v1.0.1"
    }
  }

  spec {
    port {
      name        = "https"
      port        = 9100
      target_port = "https"
    }

    selector = {
      "app.kubernetes.io/name" = "node-exporter"
    }

    cluster_ip = "None"
  }
}

