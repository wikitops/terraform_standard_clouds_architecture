# output "sg_description" {
#   value = "${aws_security_group_rule.this.description}"
# }

output "sg_from_port" {
  value = "${aws_security_group_rule.this.from_port}"
}

output "sg_id" {
    value = "${aws_security_group_rule.this.id}"
}

output "sg_protocol" {
  value = "${aws_security_group_rule.this.protocol}"
}

output "sg_to_port" {
  value = "${aws_security_group_rule.this.to_port}"
}

output "sg_type" {
  value = "${aws_security_group_rule.this.type}"
}
