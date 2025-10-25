output "alarm_arn" {
  value = aws_cloudwatch_metric_alarm.lambda_error_alarm.arn
}