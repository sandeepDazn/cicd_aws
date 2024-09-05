provider "aws" {
  region = "ap-northeast-1"
}
resource "aws_s3_bucket" "new-bucket" {
    bucket = "new-bucket-007-007-111"
    tags = {
        first = "first tag"
        second = "second tag"
    }
}

# newly added file

resource "aws_lambda_function" "my_lambda" {
  function_name     = "my-lambda-function-sep"
  description       = "A Terraform-managed Lambda function"
  runtime           = "python3.9"
  role              = aws_iam_role.lambda_role.arn
  handler           = "lambda_function.handler"
  code {
    zip_file = file("../lambda_one.zip")
  }

  environment {
    variables = {
      MY_ENV_VAR = "value"
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_role_policy" {
  name = "lambda-role-policy"
  role = aws_iam_role.lambda_role.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource  = "arn:aws:logs:*:*:log-group:/aws/lambda/my-lambda-function*"
      }
    ]
  })
}
# resource "aws_lambda_function" "lambda_name" {
#   function_name = "007-lambda"
# #   role = ""
# handler = "index.handler"
# role = ""
# }
# data "" "name" {

# }