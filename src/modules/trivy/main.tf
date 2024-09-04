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
}