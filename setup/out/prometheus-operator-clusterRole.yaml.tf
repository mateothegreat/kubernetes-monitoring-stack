resource "kubernetes_cluster_role" "prometheus_operator" {
    metadata {
        name = "prometheus-operator"

        labels = {
            "app.kubernetes.io/component" = "controller"

            "app.kubernetes.io/name" = "prometheus-operator"

            "app.kubernetes.io/version" = "v0.42.1"
        }
    }

    rule {
        verbs      = [ "*" ]
        api_groups = [ "monitoring.coreos.com" ]
        resources  = [ "alertmanagers", "alertmanagers/finalizers", "prometheuses", "prometheuses/finalizers", "thanosrulers", "thanosrulers/finalizers", "servicemonitors", "podmonitors", "probes", "prometheusrules" ]
    }

    rule {
        verbs      = [ "*" ]
        api_groups = [ "apps" ]
        resources  = [ "statefulsets" ]
    }

    rule {
        verbs      = [ "*" ]
        api_groups = [ "" ]
        resources  = [ "configmaps", "secrets" ]
    }

    rule {
        verbs      = [ "list", "delete" ]
        api_groups = [ "" ]
        resources  = [ "pods" ]
    }

    rule {
        verbs      = [ "get", "create", "update", "delete" ]
        api_groups = [ "" ]
        resources  = [ "services", "services/finalizers", "endpoints" ]
    }

    rule {
        verbs      = [ "list", "watch" ]
        api_groups = [ "" ]
        resources  = [ "nodes" ]
    }

    rule {
        verbs      = [ "get", "list", "watch" ]
        api_groups = [ "" ]
        resources  = [ "namespaces" ]
    }

    rule {
        verbs      = [ "create" ]
        api_groups = [ "authentication.k8s.io" ]
        resources  = [ "tokenreviews" ]
    }

    rule {
        verbs      = [ "create" ]
        api_groups = [ "authorization.k8s.io" ]
        resources  = [ "subjectaccessreviews" ]
    }
}

