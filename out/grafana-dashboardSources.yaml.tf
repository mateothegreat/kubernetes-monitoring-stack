resource "kubernetes_config_map" "grafana_dashboards" {
  metadata {
    name      = "grafana-dashboards"
    namespace = "monitoring"
  }

  data = {
    "dashboards.yaml" = "{\n    \"apiVersion\": 1,\n    \"providers\": [\n        {\n            \"folder\": \"System\",\n            \"name\": \"0\",\n            \"options\": {\n                \"path\": \"/grafana-dashboard-definitions/0\"\n            },\n            \"orgId\": 1,\n            \"type\": \"file\"\n        }, {\n            \"folder\": \"Application Layer\",\n            \"name\": \"1\",\n            \"options\": {\n                \"path\": \"/grafana-dashboard-definitions/1\"\n            },\n            \"orgId\": 1,\n            \"type\": \"file\"\n        }\n    ]\n}"
  }
}

