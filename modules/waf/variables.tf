variable "acl_name" {
  type        = string
  description = "Name of the Web ACL"
}

variable "allowed_ip" {
  type        = string
  description = "Trusted IP address to allow"
}

variable "api_gateway_arn" {
  type        = string
  description = "ARN of the API Gateway to associate with WAF"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for auditability"
}