provider "aws" {
  region = "ap-northeast-1"
}
resource "aws_s3_bucket" "new-bucket" {
    bucket = "new-bucket-123456789"
    tags = {
        first = "first tag"
        second = "second tag"
    }
}