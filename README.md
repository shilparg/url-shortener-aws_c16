# url-shortener-aws_c16

# 🔗 Serverless URL Shortener Backend

This project implements a fully serverless URL Shortener using AWS, designed for auditability, scalability, and governance in regulated domains. It enforces strict CI/CD workflows, branch protection, and IP-based access control.

## 🧩 Architecture Overview

- **API Gateway** with custom domain (via Route53 + ACM)
- **Lambda Functions**:
  - `POST /newurl` → Create short URL
  - `GET /{shortid}` → Redirect to original URL
- **DynamoDB** for short ID storage
- **AWS WAF** to restrict access to specific IPs
- **CloudWatch Alarms + SNS** for error alerts
- **AWS X-Ray** for tracing
- **IAM Roles** with least privilege

## 🚀 Deployment Strategy

- Single environment (`dev`) managed via Terraform
- CI/CD enforced via GitHub Actions:
  - `terraform.yml` → Validate and plan on pull request
  - `deploy.yml` → Apply on merge to `main`
- All commits go through pull requests with status checks
- Branch protection rules enforced

## 🧠 Governance Highlights

- All resources tagged with `Environment`, `Owner`, `AuditTrail`
- WAF restricts API Gateway access to specific IPs
- CloudWatch alarms trigger on Lambda errors
- SNS topics notify stakeholders
- X-Ray enabled for Lambda tracing

## 🛠️ Setup Instructions

1. Zip Lambda code:
   ```bash
   cd lambda/create_url && zip -r ../../create_url.zip .
   cd ../retrieve_url && zip -r ../../retrieve_url.zip .
   ```
