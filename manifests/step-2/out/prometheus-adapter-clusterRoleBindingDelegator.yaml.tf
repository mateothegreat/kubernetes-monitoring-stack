resource "kubernetes_cluster_role_binding" "resource_metrics_system_auth_delegator" {
  metadata {
    name = "resource-metrics:system:auth-delegator"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "system:auth-delegator"
  }
}

