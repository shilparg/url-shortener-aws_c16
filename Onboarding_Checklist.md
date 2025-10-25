---

## ✅ Onboarding Checklist

| Task                                | Status |
|-------------------------------------|--------|
| Clone repo and install Terraform    | ☐      |
| Zip Lambda functions (`make zip`)   | ☐      |
| Run `terraform init` and `plan`     | ☐      |
| Review `README.md` and `GOVERNANCE.md` | ☐      |
| Understand CI/CD via GitHub Actions | ☐      |
| Confirm CODEOWNERS and branch rules | ☐      |
| Test deployment locally             | ☐      |
| Submit first pull request           | ☐      |

---

## 🧪 QA Critique Simulation

Here’s a sample QA critique format your team can use:

```md
# ✅ QA Review: Lambda Create URL

## 🔍 Functionality

- [x] Generates short code using base64(MD5)
- [x] Stores mapping in DynamoDB
- [x] Returns correct short URL format

## 🛡️ Governance

- [x] IAM role scoped to DynamoDB only
- [x] X-Ray tracing enabled
- [x] Tagged with audit metadata

## 🧪 Test Coverage

- [ ] Unit test for invalid input
- [ ] Unit test for duplicate URL

## 📈 Observability

- [x] CloudWatch alarm configured
- [x] SNS alert wired

## 🧠 Suggestions

- Add TTL to DynamoDB for cleanup
- Add unit tests for edge cases
```
