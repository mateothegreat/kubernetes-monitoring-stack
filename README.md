## Requirements

Convert these kubernetes manifests to terraform resource definitions.

> Note: Most of this can be done easily with `k2tf`. The CRD's however need
> some manual intervention or automation love.

See: https://github.com/sl1pm4t/k2tf

## Running

Example loop:

```bash
for f in $(ls *.yaml); do echo $f; cat $f | k2tf > out/$f.tf; done
```

## Errors that require manual intervention

```bash
➜  kubernetes-monitoring-stack git:(main) ✗ for f in $(ls *.yaml); do echo $f; cat $f | k2tf > out/$f.tf; done

alertmanager-alertmanager.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"Alertmanager\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"Alertmanager\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
alertmanager-secret.yaml
alertmanager-service.yaml
alertmanager-serviceAccount.yaml
alertmanager-serviceMonitor.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
grafana-dashboardDatasources.yaml
grafana-dashboardDefinitions.yaml
5:40PM Warn | skipping API object, kind not supported by Terraform provider.  kind=ConfigMapList
grafana-dashboardSources.yaml
grafana-deployment.yaml
grafana-service.yaml
grafana-serviceAccount.yaml
grafana-serviceMonitor.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
kube-state-metrics-clusterRole.yaml
kube-state-metrics-clusterRoleBinding.yaml
kube-state-metrics-deployment.yaml
kube-state-metrics-service.yaml
kube-state-metrics-serviceAccount.yaml
kube-state-metrics-serviceMonitor.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
node-exporter-clusterRole.yaml
node-exporter-clusterRoleBinding.yaml
node-exporter-daemonset.yaml
node-exporter-service.yaml
node-exporter-serviceAccount.yaml
node-exporter-serviceMonitor.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-adapter-apiService.yaml
prometheus-adapter-clusterRole.yaml
prometheus-adapter-clusterRoleAggregatedMetricsReader.yaml
prometheus-adapter-clusterRoleBinding.yaml
prometheus-adapter-clusterRoleBindingDelegator.yaml
prometheus-adapter-clusterRoleServerResources.yaml
prometheus-adapter-configMap.yaml
prometheus-adapter-deployment.yaml
prometheus-adapter-roleBindingAuthReader.yaml
prometheus-adapter-service.yaml
prometheus-adapter-serviceAccount.yaml
prometheus-adapter-serviceMonitor.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-clusterRole.yaml
prometheus-clusterRoleBinding.yaml
prometheus-operator-serviceMonitor.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-prometheus.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: Object 'Kind' is missing in '#apiVersion: monitoring.coreos.com/v1\n#kind: Prometheus\n#metadata:\n#  labels:\n#    prometheus: k8s\n#  name: k8s\n#  namespace: monitoring\n#spec:\n#  externalLabels:\n#    product: cam-ingest\n#    cluster: maa-ml-cam-ingest-prod\n#    environment: prod\n#  thanos:\n#    baseImage: quay.io/thanos/thanos\n#    version: v0.16.0\n#    objectStorageConfig:\n#      key: thanos.yaml\n#      name: thanos-objstore-config\n#  alerting:\n#    alertmanagers:\n#    - name: alertmanager-main\n#      namespace: monitoring\n#      port: web\n#  image: quay.io/prometheus/prometheus:v2.20.0\n#  nodeSelector:\n#    role: services\n#  podMonitorNamespaceSelector: {}\n#  podMonitorSelector: {}\n#  probeNamespaceSelector: {}\n#  probeSelector: {}\n#  replicas: 1\n#  resources:\n#    requests:\n#      memory: 200Mi\n#      cpu: 000m\n#  ruleSelector:\n#    matchLabels:\n#      prometheus: k8s\n#      role: alert-rules\n#  securityContext:\n#    fsGroup: 2000\n#    runAsNonRoot: true\n#    runAsUser: 1000\n#  serviceAccountName: prometheus-k8s\n#  serviceMonitorNamespaceSelector: {}\n#  serviceMonitorSelector: {}\n##  serviceMonitorSelector:\n##    matchLabels:\n##      team: frontend\n#  version: v2.20.0\n#  additionalScrapeConfigs:\n#    name: additional-scrape-configs\n#    key: prometheus-additional.yaml\n#  storage:\n#    volumeClaimTemplate:\n#      spec:\n#        storageClassName: gp2\n#        resources:\n#          requests:\n#            storage: 40Gi\n'\n\t* could not decode yaml object with aggregator scheme #1: Object 'Kind' is missing in '#apiVersion: monitoring.coreos.com/v1\n#kind: Prometheus\n#metadata:\n#  labels:\n#    prometheus: k8s\n#  name: k8s\n#  namespace: monitoring\n#spec:\n#  externalLabels:\n#    product: cam-ingest\n#    cluster: maa-ml-cam-ingest-prod\n#    environment: prod\n#  thanos:\n#    baseImage: quay.io/thanos/thanos\n#    version: v0.16.0\n#    objectStorageConfig:\n#      key: thanos.yaml\n#      name: thanos-objstore-config\n#  alerting:\n#    alertmanagers:\n#    - name: alertmanager-main\n#      namespace: monitoring\n#      port: web\n#  image: quay.io/prometheus/prometheus:v2.20.0\n#  nodeSelector:\n#    role: services\n#  podMonitorNamespaceSelector: {}\n#  podMonitorSelector: {}\n#  probeNamespaceSelector: {}\n#  probeSelector: {}\n#  replicas: 1\n#  resources:\n#    requests:\n#      memory: 200Mi\n#      cpu: 000m\n#  ruleSelector:\n#    matchLabels:\n#      prometheus: k8s\n#      role: alert-rules\n#  securityContext:\n#    fsGroup: 2000\n#    runAsNonRoot: true\n#    runAsUser: 1000\n#  serviceAccountName: prometheus-k8s\n#  serviceMonitorNamespaceSelector: {}\n#  serviceMonitorSelector: {}\n##  serviceMonitorSelector:\n##    matchLabels:\n##      team: frontend\n#  version: v2.20.0\n#  additionalScrapeConfigs:\n#    name: additional-scrape-configs\n#    key: prometheus-additional.yaml\n#  storage:\n#    volumeClaimTemplate:\n#      spec:\n#        storageClassName: gp2\n#        resources:\n#          requests:\n#            storage: 40Gi\n'\n\n"
prometheus-roleBindingConfig.yaml
prometheus-roleBindingSpecificNamespaces.yaml
5:40PM Warn | skipping API object, kind not supported by Terraform provider.  kind=RoleBindingList
prometheus-roleConfig.yaml
prometheus-roleSpecificNamespaces.yaml
5:40PM Warn | skipping API object, kind not supported by Terraform provider.  kind=RoleList
prometheus-rules.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"PrometheusRule\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"PrometheusRule\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-service.yaml
prometheus-serviceAccount.yaml
prometheus-serviceMonitor.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-serviceMonitorApiserver.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-serviceMonitorCoreDNS.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-serviceMonitorKubeControllerManager.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-serviceMonitorKubeScheduler.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
prometheus-serviceMonitorKubelet.yaml
5:40PM Fatal | Could not parse stdin                                         error="2 errors occurred:\n\t* could not decode yaml object with main scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\t* could not decode yaml object with aggregator scheme #1: no kind \"ServiceMonitor\" is registered for version \"monitoring.coreos.com/v1\" in scheme \"pkg/runtime/scheme.go:101\"\n\n"
```
