#!/bin/bash
set -e

echo "📦 Zipping Lambda functions..."
zip -r create_url.zip lambda/create_url/
zip -r retrieve_url.zip lambda/retrieve_url/

echo "🚀 Initializing Terraform..."
terraform init

echo "🔍 Validating Terraform..."
terraform validate

echo "📐 Planning Terraform deployment..."
terraform plan

echo "✅ Applying Terraform..."
terraform apply -auto-approve

echo "🎉 Deployment complete."