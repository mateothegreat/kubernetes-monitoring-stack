resource "kubernetes_manifest" "kube-state-metrics-clusterRoleBinding" {

    provider = kubernetes-alpha

    manifest = {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "ClusterRoleBinding",
    "metadata": {
        "labels": {
            "app.kubernetes.io/name": "kube-state-metrics",
            "app.kubernetes.io/version": "1.9.7"
        },
        "name": "kube-state-metrics"
    },
    "roleRef": {
        "apiGroup": "rbac.authorization.k8s.io",
        "kind": "ClusterRole",
        "name": "kube-state-metrics"
    },
    "subjects": [
        {
            "kind": "ServiceAccount",
            "name": "kube-state-metrics",
            "namespace": var.operator_namespace
        }
    ]
}

}
