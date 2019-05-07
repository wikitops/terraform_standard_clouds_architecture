output "elb_id" {
    value = "${aws_elb.this.id}"
}

output "elb_arn" {
    value = "${aws_elb.this.arn}"
}

output "elb_name" {
    value = "${aws_elb.this.name}"
}

output "elb_dns_name" {
    value = "${aws_elb.this.dns_name}"
}

output "elb_instances" {
    value = "${aws_elb.this.instances}"
}

output "elb_source_security_group" {
    value = "${aws_elb.this.source_security_group}"
}

output "elb_source_security_group_id" {
    value = "${aws_elb.this.source_security_group_id}"
}

output "elb_zone_id" {
    value = "${aws_elb.this.zone_id}"
}
