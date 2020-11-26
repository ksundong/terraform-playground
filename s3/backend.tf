terraform {
  backend "s3" {
    bucket = "tf101-dion-apne2-tfstate"
    key = "terraform-playground/s3/terraform.tfstate"
    region = "ap-northeast-2"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }
}

