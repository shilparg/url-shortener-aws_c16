resource "aws_lambda_function" "this" {
  function_name = var.function_name
  handler       = "main.lambda_handler"
  runtime       = "python3.11"
  role          = var.iam_role_arn
  filename      = var.lambda_zip_path

  environment {
    variables = {
      TABLE_NAME = var.table_name
      DOMAIN     = var.domain
    }
  }

  tracing_config {
    mode = "Active"
  }

  tags = var.tags
}