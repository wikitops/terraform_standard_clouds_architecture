variable "encryption_type" {
  description = "The encryption type to use for the repository"
  default     = "KMS"
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  default     = "MUTABLE"
}

variable "name" {
  description = "Name of the repository"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)"
  default     = true
  type        = bool
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(any)
  default     = {}
}
