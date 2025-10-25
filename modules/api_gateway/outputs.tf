output "api_gateway_arn" {
  value = aws_api_gateway_rest_api.url_api.execution_arn
}

output "api_url" {
  value = aws_api_gateway_domain_name.custom_domain.domain_name
}