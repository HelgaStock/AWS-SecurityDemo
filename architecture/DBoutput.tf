resource "aws_dynamodb_table" "SD-output-table" {
  name           = "SD-output-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 500
  write_capacity = 500
  hash_key       = "LogID"
  range_key      = "Created"

  attribute {
    name = "LogID"
    type = "S"
  }

  attribute {
    name = "Created"
    type = "S"
  }

  attribute {
    name = "Warning"
    type = "S"
  }

server_side_encryption {
    enabled        = true
  }

  tags = {
    Name        = "SD-output-table"
    Environment = "security"
  }
}