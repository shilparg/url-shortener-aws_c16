Absolutely, Shilpa. Here's a fully consolidated, executive-ready reference guide that captures every step, decision, and learning from your capstone project setup. This is designed for onboarding, audit trails, stakeholder alignment, and future reuse.

---

# 📘 Capstone Reference Guide: Serverless URL Shortener Backend

## 🧩 Project Overview

This capstone implements a modular, audit-ready serverless URL Shortener using AWS and Terraform. It enforces CI/CD, governance, and traceability across all components. The architecture supports recruiter-facing demos, executive presentation, and regulated domain compliance.

---

## 🧱 Infrastructure Summary

| Component             | Purpose                                                   |
| --------------------- | --------------------------------------------------------- |
| **API Gateway**       | Custom domain, routes: `POST /newurl`, `GET /{shortid}`   |
| **Lambda (Create)**   | Generates short codes, stores in DynamoDB                 |
| **Lambda (Retrieve)** | Resolves short codes, redirects to original URL           |
| **DynamoDB**          | Stores mappings of `short_code → original_url`            |
| **WAF**               | Restricts API Gateway access to specific IPs              |
| **CloudWatch**        | Monitors Lambda errors                                    |
| **SNS**               | Sends alerts on errors                                    |
| **IAM Roles**         | Scoped with least privilege for Lambda, X-Ray, CloudWatch |
| **X-Ray**             | Enables tracing for Lambda execution                      |

---

## 🛠️ Terraform Structure

### Root-Level Files

- `main.tf`: Wires all modules
- `variables.tf`: Declares shared inputs (domain, cert ARN, tags)
- `outputs.tf`: Exposes final outputs (API URL, SNS ARN)
- `terraform.tfvars`: Sets environment values (`dev`)

### Modular Folders

- `modules/api_gateway/`
- `modules/lambda_create_url/`
- `modules/lambda_retrieve_url/`
- `modules/dynamodb/`
- `modules/waf/`
- `modules/cloudwatch/`
- `modules/sns/`
- `modules/iam_roles/`

### Lambda Code

- `lambda/create_url/main.py`
- `lambda/retrieve_url/main.py`
- Zipped as `create_url.zip` and `retrieve_url.zip`

---

## 🔄 CI/CD & Git Flow

### GitHub Actions Workflows

- `.github/workflows/terraform.yml`: Validate on PR
- `.github/workflows/deploy.yml`: Apply on merge to `main`

### Branch Protection

- Require pull requests
- Require status checks
- Require review from `CODEOWNERS`

### CODEOWNERS File

```plaintext
* @shilpa-kangya
/modules/api_gateway/ @api-lead
/modules/lambda_create_url/ @backend-lead
/modules/waf/ @security-lead
```

---

## 🧪 Automation Tools

### `Makefile`

- `make zip`: Zips Lambda functions
- `make plan`: Runs Terraform plan
- `make apply`: Deploys infrastructure
- `make destroy`: Tears down resources
- `make fmt`: Formats Terraform code
- `make lint`: Runs `tflint` (if installed)

### `scripts/deploy.sh`

```bash
#!/bin/bash
set -e
zip -r create_url.zip lambda/create_url/
zip -r retrieve_url.zip lambda/retrieve_url/
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

---

## 📘 Governance & Documentation

### README.md

- Architecture overview
- Setup instructions
- CI/CD enforcement
- Team collaboration practices

### GOVERNANCE.md

- IAM and WAF policies
- Monitoring and alerting
- Audit tagging
- CI/CD rationale

### SECURITY.md

- IAM least privilege
- WAF IP restriction
- CloudWatch + SNS alerts
- X-Ray tracing
- Vulnerability reporting

### CHANGELOG.md

- Tracks feature additions and improvements

### NOTES.md

- Consolidated architecture and workflow summary
- PDF-exportable for executive presentation

### CONTRIBUTING.md

- Onboarding guide for new collaborators
- Git flow, commit format, setup steps

### QA Critique Template

- Functionality, governance, observability, suggestions

### Onboarding Checklist

- Step-by-step setup tasks with status tracking

---

## 🧠 Key Learnings & Best Practices

- Modular Terraform enables reuse, clarity, and auditability
- CI/CD via GitHub Actions enforces discipline and traceability
- Branch protection and CODEOWNERS ensure governance
- Audit tagging (`Environment`, `Owner`, `AuditTrail`) is critical for regulated domains
- WAF and IAM policies must be scoped tightly for security
- Recap documentation and stakeholder alignment protect procedural fairness
- Lambda packaging and deployment must be automated for consistency
- README and GOVERNANCE files are essential for recruiter and executive audiences

---

This guide is now your single source of truth for onboarding, governance, and capstone delivery. Let me know if you'd like help turning this into a printable PDF, recruiter pitch deck, or demo script.
