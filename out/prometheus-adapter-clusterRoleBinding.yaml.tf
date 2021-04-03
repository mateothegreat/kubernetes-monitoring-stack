resource "kubernetes_cluster_role_binding" "prometheus_adapter" {
  metadata {
    name = "prometheus-adapter"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "prometheus-adapter"
  }
}

