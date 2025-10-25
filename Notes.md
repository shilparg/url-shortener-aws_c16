# 📘 Capstone Reference Notes: Serverless URL Shortener Backend

## 🔧 Architecture Summary

| Component         | Purpose                                                       |
| ----------------- | ------------------------------------------------------------- |
| API Gateway       | Custom domain, routes for POST `/newurl` and GET `/{shortid}` |
| Lambda (Create)   | Generates short codes, stores in DynamoDB                     |
| Lambda (Retrieve) | Resolves short codes, redirects to original URL               |
| DynamoDB          | Stores mappings of `short_code → original_url`                |
| WAF               | Restricts API Gateway access to specific IPs                  |
| CloudWatch        | Monitors Lambda errors                                        |
| SNS               | Sends alerts on errors                                        |
| IAM Roles         | Scoped with least privilege for Lambda, X-Ray, CloudWatch     |
| X-Ray             | Enables tracing for Lambda execution                          |

## 🧱 Terraform Structure

- `main.tf` wires all modules
- `variables.tf` declares shared inputs
- `outputs.tf` exposes final outputs
- `terraform.tfvars` sets environment values
- `modules/*` contains reusable infrastructure
- `lambda/*` contains zipped Python handlers
- `.github/workflows/*` contains CI/CD pipelines
- `README.md`, `GOVERNANCE.md`, `CODEOWNERS` enforce governance
- `examples/dev/main.tf` for local testing

## 🔄 CI/CD & Git Flow

- GitHub Actions:
  - `terraform.yml`: Validate on PR
  - `deploy.yml`: Apply on merge
- Branch protection:
  - Require PRs and status checks
  - Enforce `CODEOWNERS` review

## 🛡️ Governance Highlights

- Tags: `Environment`, `Owner`, `AuditTrail`
- WAF restricts access to trusted IPs
- CloudWatch alarms + SNS alerts
- IAM roles scoped with least privilege
- X-Ray tracing enabled

## 👥 Team Collaboration Tips

- Use commit prefixes: `feat:`, `fix:`, `docs:`
- Assign module leads via `CODEOWNERS`
- Document decisions in `README.md` or `GOVERNANCE.md`
- Use recap emails for stakeholder alignment
