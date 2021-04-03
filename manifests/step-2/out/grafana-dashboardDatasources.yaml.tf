resource "kubernetes_secret" "grafana_datasources" {
  metadata {
    name      = "grafana-datasources"
    namespace = "monitoring"
  }

  data = {
    "datasources.yaml" = "{\n    \"apiVersion\": 1,\n    \"datasources\": [\n        {\n            \"access\": \"proxy\",\n            \"editable\": false,\n            \"name\": \"prometheus\",\n            \"orgId\": 1,\n            \"type\": \"prometheus\",\n            \"url\": \"http://prometheus-k8s.monitoring.svc:9090\",\n            \"version\": 1\n        }\n    ]\n}"
  }

  type = "Opaque"
}

