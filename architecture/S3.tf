resource "aws_s3_bucket" "SD-Cloudtrail-Reports" {
  bucket = "SD-Cloudtrail-Reports"

  tags = {
    Name        = "SD-Cloudtrail-Reports"
    Environment = "Security"
  }
}

resource "aws_s3_bucket_acl" "SD-Cloudtrail-Reports" {
  bucket = aws_s3_bucket.SD-Cloudtrail-Reports.id
  acl    = "private"
}