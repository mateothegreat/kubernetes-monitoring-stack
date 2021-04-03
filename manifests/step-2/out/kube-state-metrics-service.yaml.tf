resource "kubernetes_service" "kube_state_metrics" {
  metadata {
    name      = "kube-state-metrics"
    namespace = "monitoring"

    labels = {
      "app.kubernetes.io/name" = "kube-state-metrics"

      "app.kubernetes.io/version" = "1.9.7"
    }
  }

  spec {
    port {
      name        = "https-main"
      port        = 8443
      target_port = "https-main"
    }

    port {
      name        = "https-self"
      port        = 9443
      target_port = "https-self"
    }

    selector = {
      "app.kubernetes.io/name" = "kube-state-metrics"
    }

    cluster_ip = "None"
  }
}

