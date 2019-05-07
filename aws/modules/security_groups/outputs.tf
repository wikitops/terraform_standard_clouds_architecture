output "sg_arn" {
  value = "${aws_security_group.this.arn}"
}

output "sg_id" {
  value = "${aws_security_group.this.id}"
}

output "sg_name" {
  value = "${aws_security_group.this.name}"
}

output "sg_owner_id" {
  value = "${aws_security_group.this.owner_id}"
}
