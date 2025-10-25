variable "function_name" {
  type = string
}

variable "iam_role_arn" {
  type = string
}

variable "lambda_zip_path" {
  type = string
}

variable "table_name" {
  type = string
}

variable "domain" {
  type = string
}

variable "tags" {
  type = map(string)
}