# 🤝 Contributing to URL Shortener Backend

Welcome! This guide outlines how to contribute to our modular, CI/CD-enforced serverless backend.

## 🧱 Repo Structure

- `main.tf`, `variables.tf`, `outputs.tf`, `terraform.tfvars` → Root wiring
- `modules/*` → Reusable Terraform modules
- `lambda/*` → Python handlers zipped for deployment
- `.github/workflows/*` → CI/CD pipelines
- `README.md`, `GOVERNANCE.md`, `NOTES.md`, `CODEOWNERS` → Governance and documentation

## 🛠️ Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/your-org/url-shortener-aws.git
   cd url-shortener-aws
   ```
