resource "aws_s3_bucket" "sd-cloudtrail-reports" {
  bucket = "sd-cloudtrail-reports"

  tags = {
    Name        = "sd-cloudtrail-reports"
    Environment = "Security"
  }
}

resource "aws_s3_bucket_acl" "sd-cloudtrail-reports" {
  bucket = aws_s3_bucket.sd-cloudtrail-reports.id
  acl    = "private"
}