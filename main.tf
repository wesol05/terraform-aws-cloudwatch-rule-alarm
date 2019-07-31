data "aws_sns_topic" "topic" {
  name = var.sns-topic
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  count = var.enabled ? 1 : 0
  alarm_name = "${var.rule-name} event rule"
  alarm_description = "Failed to execute cloudwatch rule ${var.rule-name}"

  metric_name = "FailedInvocations"
  namespace = "AWS/Events"
  period = var.period
  statistic = "SampleCount"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = var.evaluation_periods
  datapoints_to_alarm = var.datapoints_to_alarm
  threshold = 0
  treat_missing_data = "notBreaching"

  dimensions = {
    RuleName = var.rule-name
  }

  alarm_actions = [data.aws_sns_topic.topic.arn]

  tags = var.tags
}