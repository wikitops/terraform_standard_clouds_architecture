variable "type" {
  description = "The type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  default = "ingress"
}

variable "cidr_blocks" {
  description = "List of CIDR blocks."
  type = "list"
}

variable "from_port" {
  description = "The start port (or ICMP type number if protocol is 'icmp')."
}

variable "protocol" {
  description = "The protocol. If you select a protocol of '-1' (semantically equivalent to 'all', which is not a valid value here), you must specify a 'from_port' and 'to_port' equal to 0. If not icmp, tcp, udp, or '-1' use the protocol number."
}

variable "security_group_id" {
  description = "The security group to apply this rule to."
}

variable "to_port" {
  description = "The end range port (or ICMP code if protocol is 'icmp')."
}
