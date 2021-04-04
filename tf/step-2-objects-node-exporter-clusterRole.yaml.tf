resource "kubernetes_manifest" "node-exporter-clusterRole" {

    provider = kubernetes-alpha

    manifest = {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "ClusterRole",
    "metadata": {
        "name": "node-exporter"
    },
    "rules": [
        {
            "apiGroups": [
                "authentication.k8s.io"
            ],
            "resources": [
                "tokenreviews"
            ],
            "verbs": [
                "create"
            ]
        },
        {
            "apiGroups": [
                "authorization.k8s.io"
            ],
            "resources": [
                "subjectaccessreviews"
            ],
            "verbs": [
                "create"
            ]
        }
    ]
}

}