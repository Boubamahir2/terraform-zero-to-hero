provider "aws" {
    region = "us-east-1"
}

variable "ami" {
  description = "This is AMI for the instance"
}

variable "instance_type" {
  description = "This is the instance type, for example: t2.micro"
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
      name= "my first instance"
    }

# Lifecycle customizations to change default resource behaviours during plan or apply
    lifecycle {
      prevent_destroy =false
    }
}
