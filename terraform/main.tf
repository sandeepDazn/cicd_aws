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
# resource "aws_lambda_function" "lambda_name" {
#   function_name = "007-lambda"
# #   role = ""
# handler = "index.handler"
# role = ""
# }
# data "" "name" {

# }