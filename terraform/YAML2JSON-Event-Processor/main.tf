# Main Terraform Code to Develop an Event-Driven Application

# Define the provider
provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for Event Source
resource "aws_s3_bucket" "event_source_bucket" {
  bucket = "event-driven-source-aveeva-demo"

  tags = {
    Name        = "Source Bucket"
    Environment = "Demo"
  }
}

# S3 Bucket for Event Destination

resource "aws_s3_bucket" "destination_bucket" {
  bucket = "event-driven-destination-aveeva-demo"
  tags = {
    Name        = "Source Bucket"
    Environment = "Demo"
  }
}

# IAM Role for Lambda Function
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for Lambda Role
# Update IAM Policy for Lambda Role
resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  description = "IAM policy for Lambda to access S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["s3:GetObject", "s3:ListBucket"],
        Effect = "Allow",
        Resource = [
          aws_s3_bucket.event_source_bucket.arn,
          "${aws_s3_bucket.event_source_bucket.arn}/*"
        ]
      },
      {
        Action = ["s3:PutObject", "s3:PutObjectAcl"],
        Effect = "Allow",
        Resource = [
          aws_s3_bucket.destination_bucket.arn,
          "${aws_s3_bucket.destination_bucket.arn}/*"
        ]
      },
      {
        Action = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"],
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}


# Attach Policy to IAM Role
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

# Lambda Function to Process Events
resource "aws_lambda_function" "event_processor" {
  function_name    = "event-processor"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "index.handler"
  runtime          = "python3.9"
  timeout          = 30

  filename         = "lambda_function.zip" # Pre-packaged code uploaded manually

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.event_source_bucket.bucket
      DEST_BUCKET_NAME  = aws_s3_bucket.destination_bucket.bucket
    }
  }
}

# Allow S3 Bucket to invoke the Lambda function
resource "aws_lambda_permission" "allow_s3_invocation" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.event_processor.arn
  principal     = "s3.amazonaws.com"

  # Source bucket ARN
  source_arn = aws_s3_bucket.event_source_bucket.arn
}


# S3 Bucket Notification to Trigger Lambda Function
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.event_source_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.event_processor.arn
    events              = ["s3:ObjectCreated:*"]
  }

depends_on = [aws_lambda_permission.allow_s3_invocation]

}


# CloudWatch Log Group for Lambda
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.event_processor.function_name}"
  retention_in_days = 14
}

# Output to Verify Resources
output "s3_bucket_name" {
  value = aws_s3_bucket.event_source_bucket.bucket
}

output "lambda_function_name" {
  value = aws_lambda_function.event_processor.function_name
}