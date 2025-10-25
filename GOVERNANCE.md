---

## 📘 `GOVERNANCE.md`

```md
# 🛡️ Governance & Compliance

This project is designed for regulated environments requiring traceability, auditability, and secure access control.

## 🔐 IAM & Access Control

- Lambda execution roles scoped with least privilege
- Inline policies documented per function
- WAF restricts API Gateway access to specific IPs

## 📈 Monitoring & Alerts

- CloudWatch alarms trigger on Lambda errors
- SNS topics notify stakeholders
- X-Ray enabled for tracing and debugging

## 🧪 CI/CD Enforcement

- All commits require pull requests and status checks
- Terraform workflows validate infrastructure before merge
- GitHub Actions enforce deployment on `main` branch

## 🧾 Audit Trail

- All resources tagged with:
  - `Environment`
  - `Owner`
  - `AuditTrail`
- Commit history and PR reviews provide traceability
- Recap documentation encouraged for stakeholder alignment

## 🧩 Modular Infrastructure

- Terraform modules for each component:
  - API Gateway
  - Lambda (Create/Retrieve)
  - DynamoDB
  - WAF
  - CloudWatch
  - SNS
  - IAM Roles
```
