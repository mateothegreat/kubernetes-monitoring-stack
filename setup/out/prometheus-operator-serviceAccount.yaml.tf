resource "kubernetes_service_account" "prometheus_operator" {
  metadata {
    name      = "prometheus-operator"
    namespace = "monitoring"

    labels = {
      "app.kubernetes.io/component" = "controller"

      "app.kubernetes.io/name" = "prometheus-operator"

      "app.kubernetes.io/version" = "v0.42.1"
    }
  }
}

