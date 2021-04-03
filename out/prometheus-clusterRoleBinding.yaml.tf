resource "kubernetes_cluster_role_binding" "prometheus_k_8_s" {
  metadata {
    name = "prometheus-k8s"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-k8s"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "prometheus-k8s"
  }
}

