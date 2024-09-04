provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
  debug = true
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "trivy-namespace" {
  metadata {
    name = "trivy-namespace"
  }
}

module "trivy" {
    source = "./modules/trivy"

    depends_on = [ kubernetes_namespace.trivy-namespace ]
}