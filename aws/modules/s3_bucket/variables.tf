variable "aws_s3_bucket" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type = "list"
}

variable "tags" {
  description = "Default tags for all resources."
  type = "map"
}
