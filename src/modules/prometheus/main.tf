resource "helm_release" "prometheus" {
  name       = "prometheus"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  #wait = false
  namespace = "prometheus-namespace"

  set {
    name = "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
    value = "false"
  }
  set {
    name = "prometheus.prometheusSpec.serviceMonitorSelector"
    value = ""
  }
  set {
    name = "prometheus.prometheusSpec.serviceMonitorNamespaceSelector"
    value = ""
  }
}
