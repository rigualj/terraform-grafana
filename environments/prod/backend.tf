# environments/prod/backend.tf

terraform {
  backend "s3" {
    # Required settings:
    bucket = "terraform-rigualj"
    key    = "grafana/prod/terraform.tfstate"
    region = "us-east-1"

    # Required for state locking:
    dynamodb_table = "terraform-state-lock"

    # Recommended settings:
    encrypt = true
  }
}