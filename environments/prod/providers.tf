terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.20.0 " # Use the latest appropriate version
    }
  }
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_auth_token
  # Optional: increase retries for flaky APIs
  # retries = 3
}