# Strapi ECS Fargate Deployment (Terraform + GitHub Actions)

## Overview
Deploy Strapi using AWS ECS Fargate, configured via Terraform, and automated with CI/CD. CloudWatch is set up to capture logs and monitor resource usage.

## Requirements
- AWS IAM user/key with permissions: ECS, ECR, CloudWatch, IAM, VPC, etc.
- Terraform >= 1.0
- Docker

## Setup
1. Fork/clone this repository.
2. Create an S3 bucket for Terraform state.
3. Edit `terraform/variables.tf` to set `backend_bucket`.
4. Add `subnet_ids`, `security_group_id`, and `ecr_repository_url` variables.
5. Push to `main` to trigger GitHub Actions.

## Monitoring
- Logs: available under CloudWatch Log Group `/ecs/strapi`
- Alarms: CPU/Memory >80%
- (Optional) Dashboard: StrapiDashboard

## Cleanup
```bash
cd terraform
terraform destroy --auto-approve

### 🚀 Next Steps
1. **Fill in variable values** (e.g., subnet IDs, security group, ECR URL).
2. **Push to GitHub** and watch Actions build, push image, apply infra.
3. **Verify**:
   - Strapi service running in ECS.
   - Logs flowing into CloudWatch under `/ecs/strapi`.
   - Metrics and alarms showing up in CloudWatch Console.
