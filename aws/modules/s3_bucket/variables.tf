variable "acl" {
  description = "The canned ACL to apply."
  default     = "private"
}

variable "buckets" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = "list"
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error."
  default     = false
}

variable "region" {
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee."
}

variable "tags" {
  description = "Default tags for all resources."
  type        = "map"
}

variable "versioning_enabled" {
  description = "Enable versioning."
  default     = false
}
