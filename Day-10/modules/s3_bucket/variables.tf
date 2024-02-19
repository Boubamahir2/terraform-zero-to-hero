variable "bucket_names" {
  type = map(string)
}

variable "dev_bucket_name" {
  type = string
}

variable "stage_bucket_name" {
  type = string
}

variable "prod_bucket_name" {
  type = string
}

variable "acl" {
  type    = string
  default = "private"
}
