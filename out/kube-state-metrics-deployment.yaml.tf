resource "kubernetes_deployment" "kube_state_metrics" {
  metadata {
    name      = "kube-state-metrics"
    namespace = "monitoring"

    labels = {
      "app.kubernetes.io/name" = "kube-state-metrics"

      "app.kubernetes.io/version" = "1.9.7"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "app.kubernetes.io/name" = "kube-state-metrics"
      }
    }

    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = "kube-state-metrics"

          "app.kubernetes.io/version" = "1.9.7"
        }
      }

      spec {
        container {
          name  = "kube-state-metrics"
          image = "quay.io/coreos/kube-state-metrics:v1.9.7"
          args  = ["--host=127.0.0.1", "--port=8081", "--telemetry-host=127.0.0.1", "--telemetry-port=8082"]

          security_context {
            run_as_user = 65534
          }
        }

        container {
          name  = "kube-rbac-proxy-main"
          image = "quay.io/brancz/kube-rbac-proxy:v0.6.0"
          args  = ["--logtostderr", "--secure-listen-address=:8443", "--tls-cipher-suites=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305", "--upstream=http://127.0.0.1:8081/"]

          port {
            name           = "https-main"
            container_port = 8443
          }

          security_context {
            run_as_user = 65534
          }
        }

        container {
          name  = "kube-rbac-proxy-self"
          image = "quay.io/brancz/kube-rbac-proxy:v0.6.0"
          args  = ["--logtostderr", "--secure-listen-address=:9443", "--tls-cipher-suites=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305", "--upstream=http://127.0.0.1:8082/"]

          port {
            name           = "https-self"
            container_port = 9443
          }

          security_context {
            run_as_user = 65534
          }
        }

        node_selector = {
          "kubernetes.io/os" = "linux"
        }

        service_account_name = "kube-state-metrics"
      }
    }
  }
}

