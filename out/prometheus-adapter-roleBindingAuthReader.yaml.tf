resource "kubernetes_role_binding" "resource_metrics_auth_reader" {
  metadata {
    name      = "resource-metrics-auth-reader"
    namespace = "kube-system"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "extension-apiserver-authentication-reader"
  }
}

