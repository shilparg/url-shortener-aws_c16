
resource "aws_cloudwatch_metric_alarm" "lambda_error_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Triggers when Lambda function errors exceed threshold"
  dimensions = {
    FunctionName = var.lambda_name
  }
  alarm_actions = [var.sns_topic_arn]
  tags          = var.tags
}