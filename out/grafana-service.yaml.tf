resource "kubernetes_service" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "monitoring"

    labels = {
      app = "grafana"
    }

    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-internal" = "0.0.0.0/0"

      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }

  spec {
    port {
      name        = "http"
      port        = 80
      target_port = "http"
    }

    selector = {
      app = "grafana"
    }

    type = "LoadBalancer"
  }
}

