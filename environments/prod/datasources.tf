
data "grafana_dashboard" "existing_ui_dashboard" {
  uid = "befqkw8vyq328e" # <-- IMPORTANT: Replace with REAL UID from Grafana
}

data "grafana_folders" "folders" {
}

data "grafana_dashboards" "dashboards" {
}