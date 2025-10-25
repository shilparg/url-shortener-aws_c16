variable "alarm_name" {
  type        = string
  description = "Name of the CloudWatch alarm"
}

variable "lambda_name" {
  type        = string
  description = "Name of the Lambda function to monitor"
}

variable "sns_topic_arn" {
  type        = string
  description = "ARN of the SNS topic to notify on alarm"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for auditability"
}