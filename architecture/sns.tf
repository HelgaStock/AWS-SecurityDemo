resource "aws_sns_topic" "email-monitor-topic" {
  name = "email-monitor-topic"
}
resource "aws_lambda_permission" "allow-sns-to-lambda" {
  function_name = aws_lambda_function.server_monitoring_function.function_name
  action = "lambda:InvokeFunction"
  principal = "sns.amazonaws.com"
  source_arn = aws_sns_topic.email-monitor-topic.arn
  statement_id = "AllowExecutionFromSNS"
}
resource "aws_sns_topic_subscription" "email-subscription" {
  topic_arn = aws_sns_topic.email-monitor-topic.arn
  protocol = "email"
  endpoint = "helga.stock@me.com"
}
resource "aws_cloudwatch_log_group" "email-monitor" {
  name = "/aws/lambda/${aws_lambda_function.server_monitoring_function.function_name}"
  retention_in_days = 1
}
resource "aws_cloudwatch_event_rule" "publish-sns-rule" {
  name = "publish-sns-rule"
  schedule_expression = "rate(1 minute)"
}
resource "aws_sns_topic_policy" "default" {
  count  = 1
  arn    = aws_sns_topic.email-monitor-topic.arn
  policy = "${data.aws_iam_policy_document.sns_topic_policy.0.json}"
}

data "aws_iam_policy_document" "sns_topic_policy" {
  count = "1"
  statement {
    sid       = "Allow CloudwatchEvents"
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.email-monitor-topic.arn]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}
resource "aws_cloudwatch_event_target" "sns-publish" {
  count = "1"
  rule = aws_cloudwatch_event_rule.publish-sns-rule.name
  target_id = "email-monitor"
  arn = aws_sns_topic.email-monitor-topic.arn
}