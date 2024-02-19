provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "value"
}

# variable "workspace_name" {
#   type    = string
#   default = terraform.workspace
# }


variable "instance_type" {
  description = "value"
  type        = map(string)

  default = {
    "dev"   = "t2.micro"
    "stage" = "t2.medium"
    "prod"  = "t2.xlarge"
  }
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}

resource "aws_s3_bucket" "mys3perenv" {
  for_each = {
    "dev"   = "dev-s3-bucket-00741"
    "stage" = "qa-s3-bucket-00741"
    "prod"  = "prod-s3-bucket -00741"
  }
  bucket = "$(each.key)-$(each. value)"
  acl    = "private"
  tags = {
    value          = each.value
    env            = each.key
    s3-bucket-name = "$(each.key)-$(each. value)"
  }
}

# IAM users creation using for_each (set of string)
resource "aws_iam_user" "iamuser" {
  for_each = toset(["bouba","amamahir","wizprince","lilama"])
  name =  each.key
}


