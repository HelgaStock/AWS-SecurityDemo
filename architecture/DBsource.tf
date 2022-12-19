resource "aws_dynamodb_table" "sd-source-table" {
  name           = "sd-source-table"
  read_capacity  = 500
  write_capacity = 500
  hash_key       = "System"
  range_key      = "Title"

  attribute {
    name = "System"
    type = "S"
  } 

  attribute {
    name = "Title"
    type = "S"
  }


server_side_encryption {
    enabled        = true
  }

  tags = {
    Name        = "sd-source-table"
    Environment = "security"
  }
}