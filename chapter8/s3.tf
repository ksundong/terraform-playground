resource "aws_s3_bucket" "terraform101_dion" {
  bucket = "terraform101-dion-bucket"
  acl = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
