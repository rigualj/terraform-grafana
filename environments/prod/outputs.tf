output "created_dashboard_url" {
  description = "URL of the newly created Terraform test dashboard"
  value       = "${var.grafana_url}${grafana_dashboard.test_dashboard.url}"
}

output "created_folder_uid" {
  description = "UID of the created Terraform Managed folder"
  value       = grafana_folder.terraform_managed.uid
}

output "referenced_dashboard_uid" {
  description = "UID of the existing dashboard referenced by the data source"
  value       = data.grafana_dashboard.existing_ui_dashboard.uid
  # Note: This just confirms the data source found it by outputting the UID you gave it.
}

output "referenced_dashboard_title" {
  description = "Title of the existing dashboard referenced by the data source"
  # The data source fetches details about the existing dashboard
  value = jsondecode(data.grafana_dashboard.existing_ui_dashboard.config_json).title
}

output "referenced_dashboard_grafana_url" {
  description = "Full URL of the existing dashboard referenced by the data source"
  value       = "${var.grafana_url}${data.grafana_dashboard.existing_ui_dashboard.url}"
}

output "folder_list" {
  description = "List of all folders in Grafana"
  value       = data.grafana_folders.folders
}

output "dashboard_list" {
  description = "List of all dashboards in Grafana"
  value       = data.grafana_dashboards.dashboards
}