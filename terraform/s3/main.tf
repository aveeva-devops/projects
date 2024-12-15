resource "aws_s3_bucket" "my_bucket" {
  bucket = "TechTideJan2025"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}
