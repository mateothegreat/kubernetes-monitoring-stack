resource "kubernetes_manifest" "prometheus-clusterRoleBinding" {

    provider = kubernetes-alpha

    manifest = {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "ClusterRoleBinding",
    "metadata": {
        "name": "prometheus-k8s"
    },
    "roleRef": {
        "apiGroup": "rbac.authorization.k8s.io",
        "kind": "ClusterRole",
        "name": "prometheus-k8s"
    },
    "subjects": [
        {
            "kind": "ServiceAccount",
            "name": "prometheus-k8s",
            "namespace": var.operator_namespace
        }
    ]
}

}
