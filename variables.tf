variable "domain" {
  type        = string
  description = "Custom domain name for API Gateway"
}

variable "acm_cert_arn" {
  type        = string
  description = "ARN of the ACM certificate"
}

variable "allowed_ip" {
  type        = string
  description = "IP address allowed by WAF"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}