variable "description" {
  description = "The security group description."
  default = "Managed by Terraform"
}

variable "name" {
  description = "The name of the security group. If omitted, Terraform will assign a random, unique name."
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  default = ""
}

variable "tags" {
  description = "Defaults tags to any resources"
  type = "map"
}

variable "vpc_id" {
  description = "The VPC ID"
}
