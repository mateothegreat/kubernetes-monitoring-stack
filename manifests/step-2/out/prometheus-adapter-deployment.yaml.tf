resource "kubernetes_deployment" "prometheus_adapter" {
  metadata {
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "prometheus-adapter"
      }
    }

    template {
      metadata {
        labels = {
          name = "prometheus-adapter"
        }
      }

      spec {
        volume {
          name = "tmpfs"
        }

        volume {
          name = "volume-serving-cert"
        }

        volume {
          name = "config"

          config_map {
            name = "adapter-config"
          }
        }

        container {
          name  = "prometheus-adapter"
          image = "directxman12/k8s-prometheus-adapter:v0.7.0"
          args  = ["--cert-dir=/var/run/serving-cert", "--config=/etc/adapter/config.yaml", "--logtostderr=true", "--metrics-relist-interval=1m", "--prometheus-url=http://prometheus-k8s.monitoring.svc.cluster.local:9090/", "--secure-port=6443"]

          port {
            container_port = 6443
          }

          volume_mount {
            name       = "tmpfs"
            mount_path = "/tmp"
          }

          volume_mount {
            name       = "volume-serving-cert"
            mount_path = "/var/run/serving-cert"
          }

          volume_mount {
            name       = "config"
            mount_path = "/etc/adapter"
          }
        }

        node_selector = {
          role = "services"
        }

        service_account_name = "prometheus-adapter"
      }
    }

    strategy {
      rolling_update {
        max_surge = "1"
      }
    }
  }
}

