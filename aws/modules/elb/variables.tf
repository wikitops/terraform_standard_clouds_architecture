variable "availability_zones" {
  description = "(Required for an EC2-classic ELB) The AZ's to serve traffic in."
  type = "list"
}

variable "connection_draining" {
  description = "Boolean to enable connection draining."
  default = "false"
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain."
  default = 300
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing. Default: true."
  default = "true"
}

variable "default_tags" {
  description = "Tags for all resources."
  type = "map"
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  default = 60
}

variable "instances" {
  description = "The list of instances in the ELB."
  type = "list"
  default = []
}

variable "name" {
  description = "The name of the ELB."
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ELB. Only valid if creating an ELB within a VPC."
  type = "list"
}

variable "subnets" {
  description = "(Required for a VPC ELB) A list of subnet IDs to attach to the ELB."
  type = "list"
}

# Listener
variable "instance_port" {
  description = "The port on the instance to route to."
}

variable "instance_protocol" {
  description = "The protocol to use to the instance. Valid values are HTTP, HTTPS, TCP, or SSL."
  default = "TCP"
}

variable "lb_port" {
  description = "The port to listen on for the load balancer."
}

variable "lb_protocol" {
  description = "The protocol to listen on. Valid values are HTTP, HTTPS, TCP, or SSL."
  default = "TCP"
}

variable "ssl_certificate_id" {
  description = "The ARN of an SSL certificate you have uploaded to AWS IAM. Note ECDSA-specific restrictions below. Only valid when lb_protocol is either HTTPS or SSL."
  default = ""
}

# Healthcheck
variable "healthy_threshold" {
  description = "The number of checks before the instance is declared healthy."
  default = 2
}

variable "interval" {
  description = "The interval between checks."
  default = 30
}

variable "target" {
  description = "The target of the check. Valid pattern is '${PROTOCOL}:${PORT}${PATH}', where PROTOCOL values are: HTTP, HTTPS - PORT and PATH are required TCP, SSL - PORT is required, PATH is not supported"
  default = ""
}

variable "timeout" {
  description = "The length of time before the check times out."
  default = 3
}

variable "unhealthy_threshold" {
  description = "The number of checks before the instance is declared unhealthy."
  default = 2
}

# Access Logs
variable "bucket" {
  description = "The S3 bucket name to store the logs in."
  default = ""
}

variable "bucket_prefix" {
  description = "The S3 bucket prefix. Logs are stored in the root if not configured."
  default = ""
}

variable "enabled" {
  description = "Boolean to enable / disable access_logs."
  default = "true"
}

variable "interval_access_log" {
  description = "The publishing interval in minutes."
  default = 60
}
