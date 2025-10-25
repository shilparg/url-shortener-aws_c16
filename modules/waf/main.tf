resource "aws_wafv2_ip_set" "allowed_ips" {
  name               = "allowed-ips"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = [var.allowed_ip] # Single IP string passed as a list

  tags = var.tags
}

resource "aws_wafv2_web_acl" "api_acl" {
  name  = var.acl_name
  scope = "REGIONAL"

  default_action {
    block {}
  }

  rule {
    name     = "AllowSpecificIP"
    priority = 1

    action {
      allow {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.allowed_ips.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AllowSpecificIP"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "WebACL"
    sampled_requests_enabled   = true
  }

  tags = var.tags
}

resource "aws_wafv2_web_acl_association" "api_waf" {
  resource_arn = var.api_gateway_arn
  web_acl_arn  = aws_wafv2_web_acl.api_acl.arn
}