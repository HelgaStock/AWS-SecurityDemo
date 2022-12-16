resource "aws_lambda_function" "server_monitoring-function" {
  function_name = "server_monitoring_function"
  filename      = "architecture/build/monitor.zip"
  role          = "arn:aws:iam::534283426081:role/LabRole"
  handler       = "monitor.handler"
  timeout       = 300
  runtime       = "python3.9"

  environment {
    variables = {
      MONITOR_TABLE_NAME = aws_dynamodb_table.SD-source-table.name
    }
  }
}
