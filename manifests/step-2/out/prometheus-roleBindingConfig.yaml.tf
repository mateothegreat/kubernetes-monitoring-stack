resource "kubernetes_role_binding" "prometheus_k_8_s_config" {
  metadata {
    name      = "prometheus-k8s-config"
    namespace = "monitoring"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-k8s"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "prometheus-k8s-config"
  }
}

