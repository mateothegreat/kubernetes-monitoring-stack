resource "kubernetes_daemonset" "node_exporter" {
  metadata {
    name      = "node-exporter"
    namespace = "monitoring"

    labels = {
      "app.kubernetes.io/name" = "node-exporter"

      "app.kubernetes.io/version" = "v1.0.1"
    }
  }

  spec {
    selector {
      match_labels = {
        "app.kubernetes.io/name" = "node-exporter"
      }
    }

    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = "node-exporter"

          "app.kubernetes.io/version" = "v1.0.1"
        }
      }

      spec {
        volume {
          name = "proc"

          host_path {
            path = "/proc"
          }
        }

        volume {
          name = "sys"

          host_path {
            path = "/sys"
          }
        }

        volume {
          name = "root"

          host_path {
            path = "/"
          }
        }

        container {
          name  = "node-exporter"
          image = "quay.io/prometheus/node-exporter:v1.0.1"
          args  = ["--web.listen-address=127.0.0.1:9100", "--path.procfs=/host/proc", "--path.sysfs=/host/sys", "--path.rootfs=/host/root", "--no-collector.wifi", "--no-collector.hwmon", "--collector.filesystem.ignored-mount-points=^/(dev|proc|sys|var/lib/docker/.+|var/lib/kubelet/pods/.+)($|/)"]

          resources {
            limits {
              cpu    = "250m"
              memory = "180Mi"
            }

            requests {
              memory = "180Mi"
              cpu    = "102m"
            }
          }

          volume_mount {
            name              = "proc"
            read_only         = true
            mount_path        = "/host/proc"
            mount_propagation = "HostToContainer"
          }

          volume_mount {
            name              = "sys"
            read_only         = true
            mount_path        = "/host/sys"
            mount_propagation = "HostToContainer"
          }

          volume_mount {
            name              = "root"
            read_only         = true
            mount_path        = "/host/root"
            mount_propagation = "HostToContainer"
          }
        }

        container {
          name  = "kube-rbac-proxy"
          image = "quay.io/brancz/kube-rbac-proxy:v0.6.0"
          args  = ["--logtostderr", "--secure-listen-address=[$(IP)]:9100", "--tls-cipher-suites=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305", "--upstream=http://127.0.0.1:9100/"]

          port {
            name           = "https"
            host_port      = 9100
            container_port = 9100
          }

          env {
            name = "IP"

            value_from {
              field_ref {
                field_path = "status.podIP"
              }
            }
          }

          resources {
            limits {
              cpu    = "20m"
              memory = "40Mi"
            }

            requests {
              cpu    = "10m"
              memory = "20Mi"
            }
          }
        }

        node_selector = {
          "kubernetes.io/os" = "linux"
        }

        service_account_name = "node-exporter"
        host_network         = true
        host_pid             = true

        security_context {
          run_as_user     = 65534
          run_as_non_root = true
        }

        toleration {
          operator = "Exists"
        }
      }
    }

    strategy {
      rolling_update {
        max_unavailable = "10%"
      }
    }
  }
}

