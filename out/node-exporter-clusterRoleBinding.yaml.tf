resource "kubernetes_cluster_role_binding" "node_exporter" {
  metadata {
    name = "node-exporter"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "node-exporter"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "node-exporter"
  }
}

