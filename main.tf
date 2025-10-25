module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = "url-shortener-table"
  tags       = var.tags
}

module "iam_roles" {
  source = "./modules/iam_roles"
  tags   = var.tags
}

module "lambda_create_url" {
  source          = "./modules/lambda_create_url"
  function_name   = "create-url"
  iam_role_arn    = module.iam_roles.lambda_role_arn
  lambda_zip_path = "create_url.zip"
  table_name      = module.dynamodb.table_name
  domain          = var.domain
  tags            = var.tags
}

module "lambda_retrieve_url" {
  source          = "./modules/lambda_retrieve_url"
  function_name   = "retrieve-url"
  iam_role_arn    = module.iam_roles.lambda_role_arn
  lambda_zip_path = "retrieve_url.zip"
  table_name      = module.dynamodb.table_name
  domain          = var.domain
  tags            = var.tags
}

module "api_gateway" {
  source              = "./modules/api_gateway"
  api_name            = "url-shortener-api"
  domain_name         = var.domain
  certificate_arn     = var.acm_cert_arn
  lambda_create_arn   = module.lambda_create_url.lambda_arn
  lambda_retrieve_arn = module.lambda_retrieve_url.lambda_arn
  tags                = var.tags
}

module "waf" {
  source          = "./modules/waf"
  acl_name        = "url-shortener-waf"
  allowed_ip     = [var.allowed_ip]
  api_gateway_arn = module.api_gateway.api_gateway_arn
  tags            = var.tags
}

module "sns" {
  source     = "./modules/sns"
  topic_name = "lambda-alerts"
  tags       = var.tags
}

module "cloudwatch" {
  source        = "./modules/cloudwatch"
  alarm_name    = "lambda-error-alarm"
  lambda_name   = module.lambda_create_url.function_name
  sns_topic_arn = module.sns.topic_arn
  tags          = var.tags

  depends_on = [
    module.sns,
    module.lambda_create_url
  ]
}