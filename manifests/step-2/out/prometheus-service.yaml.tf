resource "kubernetes_service" "prometheus_k_8_s" {
  metadata {
    name      = "prometheus-k8s"
    namespace = "monitoring"

    labels = {
      prometheus = "k8s"
    }

    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-internal" = "0.0.0.0/0"

      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }

  spec {
    port {
      name        = "web"
      port        = 9090
      target_port = "web"
    }

    selector = {
      app = "prometheus"

      prometheus = "k8s"
    }

    type = "LoadBalancer"
  }
}

