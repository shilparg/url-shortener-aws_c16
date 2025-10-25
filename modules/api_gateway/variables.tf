variable "api_name" {
  type        = string
  description = "Name of the API Gateway REST API"
}

variable "domain_name" {
  type        = string
  description = "Custom domain name for API Gateway"
}

variable "certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for the custom domain"
}

variable "lambda_create_arn" {
  type        = string
  description = "ARN of the Lambda function for POST /newurl"
}

variable "lambda_retrieve_arn" {
  type        = string
  description = "ARN of the Lambda function for GET /{shortid}"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for auditability"
}