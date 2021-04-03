resource "kubernetes_deployment" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "monitoring"

    labels = {
      app = "grafana"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }

        annotations = {
          "checksum/grafana-datasources" = "48faab41f579fc8efde6034391496f6a"
        }
      }

      spec {
        volume {
          name = "grafana-storage"
        }

        volume {
          name = "grafana-datasources"

          secret {
            secret_name = "grafana-datasources"
          }
        }

        volume {
          name = "grafana-dashboards"

          config_map {
            name = "grafana-dashboards"
          }
        }

        volume {
          name = "grafana-dashboard-apiserver"

          config_map {
            name = "grafana-dashboard-apiserver"
          }
        }

        volume {
          name = "grafana-dashboard-cluster-total"

          config_map {
            name = "grafana-dashboard-cluster-total"
          }
        }

        volume {
          name = "grafana-dashboard-controller-manager"

          config_map {
            name = "grafana-dashboard-controller-manager"
          }
        }

        volume {
          name = "grafana-dashboard-k8s-resources-cluster"

          config_map {
            name = "grafana-dashboard-k8s-resources-cluster"
          }
        }

        volume {
          name = "grafana-dashboard-k8s-resources-namespace"

          config_map {
            name = "grafana-dashboard-k8s-resources-namespace"
          }
        }

        volume {
          name = "grafana-dashboard-k8s-resources-node"

          config_map {
            name = "grafana-dashboard-k8s-resources-node"
          }
        }

        volume {
          name = "grafana-dashboard-k8s-resources-pod"

          config_map {
            name = "grafana-dashboard-k8s-resources-pod"
          }
        }

        volume {
          name = "grafana-dashboard-k8s-resources-workload"

          config_map {
            name = "grafana-dashboard-k8s-resources-workload"
          }
        }

        volume {
          name = "grafana-dashboard-k8s-resources-workloads-namespace"

          config_map {
            name = "grafana-dashboard-k8s-resources-workloads-namespace"
          }
        }

        volume {
          name = "grafana-dashboard-kubelet"

          config_map {
            name = "grafana-dashboard-kubelet"
          }
        }

        volume {
          name = "grafana-dashboard-namespace-by-pod"

          config_map {
            name = "grafana-dashboard-namespace-by-pod"
          }
        }

        volume {
          name = "grafana-dashboard-namespace-by-workload"

          config_map {
            name = "grafana-dashboard-namespace-by-workload"
          }
        }

        volume {
          name = "grafana-dashboard-node-cluster-rsrc-use"

          config_map {
            name = "grafana-dashboard-node-cluster-rsrc-use"
          }
        }

        volume {
          name = "grafana-dashboard-node-rsrc-use"

          config_map {
            name = "grafana-dashboard-node-rsrc-use"
          }
        }

        volume {
          name = "grafana-dashboard-nodes"

          config_map {
            name = "grafana-dashboard-nodes"
          }
        }

        volume {
          name = "grafana-dashboard-persistentvolumesusage"

          config_map {
            name = "grafana-dashboard-persistentvolumesusage"
          }
        }

        volume {
          name = "grafana-dashboard-pod-total"

          config_map {
            name = "grafana-dashboard-pod-total"
          }
        }

        volume {
          name = "grafana-dashboard-prometheus-remote-write"

          config_map {
            name = "grafana-dashboard-prometheus-remote-write"
          }
        }

        volume {
          name = "grafana-dashboard-prometheus"

          config_map {
            name = "grafana-dashboard-prometheus"
          }
        }

        volume {
          name = "grafana-dashboard-proxy"

          config_map {
            name = "grafana-dashboard-proxy"
          }
        }

        volume {
          name = "grafana-dashboard-scheduler"

          config_map {
            name = "grafana-dashboard-scheduler"
          }
        }

        volume {
          name = "grafana-dashboard-statefulset"

          config_map {
            name = "grafana-dashboard-statefulset"
          }
        }

        volume {
          name = "grafana-dashboard-workload-total"

          config_map {
            name = "grafana-dashboard-workload-total"
          }
        }

        container {
          name  = "grafana"
          image = "grafana/grafana:7.1.0"

          port {
            name           = "http"
            container_port = 3000
          }

          env {
            name  = "GF_INSTALL_PLUGINS"
            value = "cloudspout-button-panel,briangann-datatable-panel,agenty-flowcharting-panel"
          }

          resources {
            limits {
              cpu    = "200m"
              memory = "200Mi"
            }

            requests {
              cpu    = "100m"
              memory = "100Mi"
            }
          }

          volume_mount {
            name       = "grafana-storage"
            mount_path = "/var/lib/grafana"
          }

          volume_mount {
            name       = "grafana-datasources"
            mount_path = "/etc/grafana/provisioning/datasources"
          }

          volume_mount {
            name       = "grafana-dashboards"
            mount_path = "/etc/grafana/provisioning/dashboards"
          }

          volume_mount {
            name       = "grafana-dashboard-apiserver"
            mount_path = "/grafana-dashboard-definitions/0/apiserver"
          }

          volume_mount {
            name       = "grafana-dashboard-cluster-total"
            mount_path = "/grafana-dashboard-definitions/0/cluster-total"
          }

          volume_mount {
            name       = "grafana-dashboard-controller-manager"
            mount_path = "/grafana-dashboard-definitions/0/controller-manager"
          }

          volume_mount {
            name       = "grafana-dashboard-k8s-resources-cluster"
            mount_path = "/grafana-dashboard-definitions/0/k8s-resources-cluster"
          }

          volume_mount {
            name       = "grafana-dashboard-k8s-resources-namespace"
            mount_path = "/grafana-dashboard-definitions/0/k8s-resources-namespace"
          }

          volume_mount {
            name       = "grafana-dashboard-k8s-resources-node"
            mount_path = "/grafana-dashboard-definitions/0/k8s-resources-node"
          }

          volume_mount {
            name       = "grafana-dashboard-k8s-resources-pod"
            mount_path = "/grafana-dashboard-definitions/0/k8s-resources-pod"
          }

          volume_mount {
            name       = "grafana-dashboard-k8s-resources-workload"
            mount_path = "/grafana-dashboard-definitions/0/k8s-resources-workload"
          }

          volume_mount {
            name       = "grafana-dashboard-k8s-resources-workloads-namespace"
            mount_path = "/grafana-dashboard-definitions/0/k8s-resources-workloads-namespace"
          }

          volume_mount {
            name       = "grafana-dashboard-kubelet"
            mount_path = "/grafana-dashboard-definitions/0/kubelet"
          }

          volume_mount {
            name       = "grafana-dashboard-namespace-by-pod"
            mount_path = "/grafana-dashboard-definitions/0/namespace-by-pod"
          }

          volume_mount {
            name       = "grafana-dashboard-namespace-by-workload"
            mount_path = "/grafana-dashboard-definitions/0/namespace-by-workload"
          }

          volume_mount {
            name       = "grafana-dashboard-node-cluster-rsrc-use"
            mount_path = "/grafana-dashboard-definitions/0/node-cluster-rsrc-use"
          }

          volume_mount {
            name       = "grafana-dashboard-node-rsrc-use"
            mount_path = "/grafana-dashboard-definitions/0/node-rsrc-use"
          }

          volume_mount {
            name       = "grafana-dashboard-nodes"
            mount_path = "/grafana-dashboard-definitions/0/nodes"
          }

          volume_mount {
            name       = "grafana-dashboard-persistentvolumesusage"
            mount_path = "/grafana-dashboard-definitions/0/persistentvolumesusage"
          }

          volume_mount {
            name       = "grafana-dashboard-pod-total"
            mount_path = "/grafana-dashboard-definitions/0/pod-total"
          }

          volume_mount {
            name       = "grafana-dashboard-prometheus-remote-write"
            mount_path = "/grafana-dashboard-definitions/0/prometheus-remote-write"
          }

          volume_mount {
            name       = "grafana-dashboard-prometheus"
            mount_path = "/grafana-dashboard-definitions/0/prometheus"
          }

          volume_mount {
            name       = "grafana-dashboard-proxy"
            mount_path = "/grafana-dashboard-definitions/0/proxy"
          }

          volume_mount {
            name       = "grafana-dashboard-scheduler"
            mount_path = "/grafana-dashboard-definitions/0/scheduler"
          }

          volume_mount {
            name       = "grafana-dashboard-statefulset"
            mount_path = "/grafana-dashboard-definitions/0/statefulset"
          }

          volume_mount {
            name       = "grafana-dashboard-workload-total"
            mount_path = "/grafana-dashboard-definitions/0/workload-total"
          }

          readiness_probe {
            http_get {
              path = "/api/health"
              port = "http"
            }
          }
        }

        node_selector = {
          "beta.kubernetes.io/os" = "linux"
        }

        service_account_name = "grafana"

        security_context {
          run_as_user     = 65534
          run_as_non_root = true
          fs_group        = 65534
        }
      }
    }
  }
}

