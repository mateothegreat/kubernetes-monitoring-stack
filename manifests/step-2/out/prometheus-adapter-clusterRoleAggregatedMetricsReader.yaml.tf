resource "kubernetes_cluster_role" "system_aggregated_metrics_reader" {
  metadata {
    name = "system:aggregated-metrics-reader"

    labels = {
      "rbac.authorization.k8s.io/aggregate-to-admin" = "true"

      "rbac.authorization.k8s.io/aggregate-to-edit" = "true"

      "rbac.authorization.k8s.io/aggregate-to-view" = "true"
    }
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = ["metrics.k8s.io"]
    resources  = ["pods", "nodes"]
  }
}

