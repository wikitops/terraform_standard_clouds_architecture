variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type = "map"
}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds."
  default = 300
}

variable "name" {
  description = "The name of the target group. If omitted, Terraform will assign a random, unique name."
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name. Cannot be longer than 6 characters."
  default = ""
}

variable "port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target."
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets."
}

variable "proxy_protocol_v2" {
  description = "Boolean to enable / disable support for proxy protocol v2 on Network Load Balancers."
  default = "false"
}

variable "slow_start" {
  description = "The amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable."
  default = 30
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address). The default is instance. Note that you can't specify targets for a target group using both instance IDs and IP addresses. If the target type is ip, specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses."
  default = "instance"
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group."
}

# Healthchecks
variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  default = 3
}

variable "interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds."
  default = 30
}

variable "matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299'). Applies to Application Load Balancers only (HTTP/HTTPS), not Network Load Balancers (TCP)."
  default = 200
}

variable "path" {
  description = "The destination for the health check request. Applies to Application Load Balancers only (HTTP/HTTPS), not Network Load Balancers (TCP)."
  default = "/"
}

variable "port_healthcheck" {
  description = "The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port."
  default = "traffic-port"  
}

variable "protocol_healthcheck" {
  description = "The protocol to use to connect with the target."
  default = "HTTP"
}

variable "timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 60 seconds and the default is 5 seconds. For Network Load Balancers, you cannot set a custom value, and the default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks."
  default = 10
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy . For Network Load Balancers, this value must be the same as the healthy_threshold."
  default = 3
}

# Stickiness
variable "cookie_duration" {
  description = "The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds)."
  default = 1
}

variable "enabled" {
  description = "Boolean to enable / disable stickiness."
  default = "true"
}

variable "type" {
  description = "The type of sticky sessions. The only current possible value is lb_cookie."
  default = "lb_cookie"
}
