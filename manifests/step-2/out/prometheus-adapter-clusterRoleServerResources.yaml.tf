resource "kubernetes_cluster_role" "resource_metrics_server_resources" {
  metadata {
    name = "resource-metrics-server-resources"
  }

  rule {
    verbs      = ["*"]
    api_groups = ["metrics.k8s.io"]
    resources  = ["*"]
  }
}

