resource "aws_s3_bucket" "mys3perenv" {
  for_each = {
    "dev"  = env("DEV_BUCKET_NAME")
    "stage" = env("STAGE_BUCKET_NAME")
    "prod" = env("PROD_BUCKET_NAME")
  }

  # ... other resources
}

