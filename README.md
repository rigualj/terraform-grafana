# Terraform Grafana Project

This repository contains Terraform infrastructure as code for managing Grafana resources in the cloud with an AWS s3 backend. The project implements CI/CD pipelines using GitHub Actions with OIDC authentication for secure AWS access.

## Features

- **AWS S3 Remote Backend**: Stores Terraform state securely with encryption enabled
- **DynamoDB State Locking**: Prevents concurrent modification of infrastructure
- **OIDC Authentication**: Secure integration between GitHub Actions and AWS
- **Multi-Environment Support**: Organized directory structure for different environments (prod, dev)
- **GitHub Actions Workflows**:
  - Automated linting and validation
  - Plan/Apply approval workflow
  - Dynamic environment detection based on changes

## Repository Structure

```
├── environments/
│   ├── prod/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   └── ...
│   └── dev/
│       └── ...
├── .github/
│   └── workflows/
│       └── terraform.yml
└── README.md
```

## Getting Started

### Prerequisites

- AWS Account with appropriate permissions
- Grafana Cloud account
- GitHub repository configured with OIDC trust relationship to AWS

### Configuration

1. Set up the required secrets in your GitHub repository:
   - `AWS_ROLE_TO_ASSUME`: ARN of the IAM role with proper permissions
   - `GRAFANA_AUTH_TOKEN`: Your Grafana API token

2. Configure the OIDC trust relationship in AWS IAM for both branch and environment contexts:
   ```json
   {
     "StringLike": {
       "token.actions.githubusercontent.com:sub": [
         "repo:username/repo:ref:refs/heads/main",
         "repo:username/repo:environment:production"
       ]
     }
   }
   ```

3. Ensure the S3 bucket and DynamoDB table exist for the remote backend

## Usage

### Automatic Workflow

Pushing changes to the `main` branch will trigger the GitHub Actions workflow:
1. The workflow detects which environment directories have changes
2. It runs `terraform plan` against those environments
3. For environments with changes, it creates a manual approval step
4. After approval, it applies the changes to the infrastructure

### Manual Workflow Triggers

You can manually trigger workflow runs using the "Run workflow" button in the Actions tab.

## Security Considerations

- OIDC connection between GitHub and AWS eliminates the need for long-lived credentials
- State file encryption is enabled for the S3 backend
- Environment-based approvals prevent unintentional infrastructure changes

