output "vpc_id" {
    value = "${aws_vpc.this.id}"
}

output "subnet_ids_private" {
    value = ["${aws_subnet.this-private.*.id}"]
}

output "subnet_ids_public" {
    value = ["${aws_subnet.this-public.*.id}"]
}

output "default_tags" {
    value = "${var.default_tags}"

}
