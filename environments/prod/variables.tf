variable "grafana_url" {
  description = "URL of the Grafana instance"
  type        = string
}

variable "grafana_auth_token" {
  description = "Authentication token for Grafana API"
  type        = string
  sensitive   = true
}

variable "environment_tag" {
  description = "Tag to identify the environment (e.g., prod, staging)"
  type        = string
  default     = "prod"
}