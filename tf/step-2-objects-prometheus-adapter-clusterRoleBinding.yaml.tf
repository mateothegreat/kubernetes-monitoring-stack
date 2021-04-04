resource "kubernetes_manifest" "prometheus-adapter-clusterRoleBinding" {

    provider = kubernetes-alpha

    manifest = {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "ClusterRoleBinding",
    "metadata": {
        "name": "prometheus-adapter"
    },
    "roleRef": {
        "apiGroup": "rbac.authorization.k8s.io",
        "kind": "ClusterRole",
        "name": "prometheus-adapter"
    },
    "subjects": [
        {
            "kind": "ServiceAccount",
            "name": "prometheus-adapter",
            "namespace": var.operator_namespace
        }
    ]
}

}
