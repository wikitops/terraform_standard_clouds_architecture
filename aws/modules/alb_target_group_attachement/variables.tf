variable "availability_zone" {
  description = "The Availability Zone where the IP address of the target is to be registered."
  default = ""
}

variable "port" {
  description = "The port on which targets receive traffic."
  default = ""
}

variable "target_group_arn" {
  description = "The ARN of the target group with which to register targets."
}

variable "target_id" {
  description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address."
}
