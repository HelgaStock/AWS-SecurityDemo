resource "aws_lambda_function" "server_monitoring_function" {
  function_name = "server_monitoring_function"
  filename      = "build/monitor.zip"
  role          = local.iam_role
  handler       = "monitor.handler"
  timeout       = 300
  runtime       = "python3.9"

  environment {
    variables = {
      MONITOR_TABLE_NAME = aws_dynamodb_table.sd-source-table.name
    }
  }
}
