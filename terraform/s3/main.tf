resource "aws_s3_bucket" "my_bucket" {
  bucket = "techtideunixwork"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}
