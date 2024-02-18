provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "bouba" {
  ami ="ami-0c7217cdde317cfec"
  instance_type ="t2.micro"
  subnet_id ="subnet-031a6e731f7bb96f1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "bouba-s3-demo-xyz" # change this
}


resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}