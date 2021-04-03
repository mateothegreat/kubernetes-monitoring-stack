resource "kubernetes_deployment" "prometheus_operator" {
  metadata {
    name      = "prometheus-operator"
    namespace = "monitoring"

    labels = {
      "app.kubernetes.io/component" = "controller"

      "app.kubernetes.io/name" = "prometheus-operator"

      "app.kubernetes.io/version" = "v0.42.1"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "app.kubernetes.io/component" = "controller"

        "app.kubernetes.io/name" = "prometheus-operator"
      }
    }

    template {
      metadata {
        labels = {
          "app.kubernetes.io/component" = "controller"

          "app.kubernetes.io/name" = "prometheus-operator"

          "app.kubernetes.io/version" = "v0.42.1"
        }
      }

      spec {
        container {
          name  = "prometheus-operator"
          image = "quay.io/prometheus-operator/prometheus-operator:v0.42.1"
          args  = ["--kubelet-service=kube-system/kubelet", "--logtostderr=true", "--config-reloader-image=jimmidyson/configmap-reload:v0.4.0", "--prometheus-config-reloader=quay.io/prometheus-operator/prometheus-config-reloader:v0.42.1"]

          port {
            name           = "http"
            container_port = 8080
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
        }

        container {
          name  = "kube-rbac-proxy"
          image = "quay.io/brancz/kube-rbac-proxy:v0.6.0"
          args  = ["--logtostderr", "--secure-listen-address=:8443", "--tls-cipher-suites=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305", "--upstream=http://127.0.0.1:8080/"]

          port {
            name           = "https"
            container_port = 8443
          }

          security_context {
            run_as_user = 65534
          }
        }

        node_selector = {
          "beta.kubernetes.io/os" = "linux"
        }

        service_account_name = "prometheus-operator"

        security_context {
          run_as_user     = 65534
          run_as_non_root = true
        }
      }
    }
  }
}

