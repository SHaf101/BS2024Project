resource "helm_release" "trivy" {
  name       = "trivy"

  repository = "https://aquasecurity.github.io/helm-charts/"
  chart      = "trivy-operator"

  #wait = false
  namespace = "trivy-namespace"

  set {
    name = "operator.clusterSbomCacheEnabled"
    value = "true"
  }
  set {
    name = "serviceMonitor.enabled"
    value = "true"
  }
  # set {
  #   name = "trivy.ignoreUnfixed"
  #   value = "true"
  # }
}