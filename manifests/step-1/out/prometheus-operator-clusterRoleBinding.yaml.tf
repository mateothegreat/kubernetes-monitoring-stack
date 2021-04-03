resource "kubernetes_cluster_role_binding" "prometheus_operator" {
  metadata {
    name = "prometheus-operator"

    labels = {
      "app.kubernetes.io/component" = "controller"

      "app.kubernetes.io/name" = "prometheus-operator"

      "app.kubernetes.io/version" = "v0.42.1"
    }
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-operator"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "prometheus-operator"
  }
}

