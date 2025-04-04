# Create a Grafana Folder to hold our TF-managed dashboard
resource "grafana_folder" "terraform_managed" {
  title = "Terraform Managed (${var.environment_tag})"
  uid   = "tf-managed-${var.environment_tag}" // Ensure UID is unique per environment if needed
}

resource "grafana_dashboard" "test_dashboard" {
  # Place this dashboard inside the folder created above
  folder = grafana_folder.terraform_managed.uid

  # Load the dashboard definition from the JSON file
  # Note the relative path from this file's location
  config_json = file("${path.module}/../../grafana_assets/dashboards/${var.environment_tag}/tf_dashboard_test.json")

  # Optional: Set a commit message for dashboard version history
  message = "Deployed by Terraform (${var.environment_tag})"

  # Optional: Set to true to overwrite existing dashboard with the same UID/Title in folder
  overwrite = true
}