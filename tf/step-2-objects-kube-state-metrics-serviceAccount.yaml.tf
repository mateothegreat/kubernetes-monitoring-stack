resource "kubernetes_manifest" "kube-state-metrics-serviceAccount" {

    provider = kubernetes-alpha

    manifest = {
    "apiVersion": "v1",
    "kind": "ServiceAccount",
    "metadata": {
        "labels": {
            "app.kubernetes.io/name": "kube-state-metrics",
            "app.kubernetes.io/version": "1.9.7"
        },
        "name": "kube-state-metrics",
        "namespace": var.operator_namespace
    }
}

}
