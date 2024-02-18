terraform {
  backend "s3" {
    bucket         = "bouba-s3-demo-xyz" # change this
    key            = "abu/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}