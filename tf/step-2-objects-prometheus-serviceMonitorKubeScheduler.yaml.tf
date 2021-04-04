resource "kubernetes_manifest" "prometheus-serviceMonitorKubeScheduler" {

    provider = kubernetes-alpha

    manifest = {
    "apiVersion": "monitoring.coreos.com/v1",
    "kind": "ServiceMonitor",
    "metadata": {
        "labels": {
            "k8s-app": "kube-scheduler"
        },
        "name": "kube-scheduler",
        "namespace": var.operator_namespace
    },
    "spec": {
        "endpoints": [
            {
                "bearerTokenFile": "/var/run/secrets/kubernetes.io/serviceaccount/token",
                "interval": "30s",
                "port": "https-metrics",
                "scheme": "https",
                "tlsConfig": {
                    "insecureSkipVerify": true
                }
            }
        ],
        "jobLabel": "k8s-app",
        "namespaceSelector": {
            "matchNames": [
                "kube-system"
            ]
        },
        "selector": {
            "matchLabels": {
                "k8s-app": "kube-scheduler"
            }
        }
    }
}

}
