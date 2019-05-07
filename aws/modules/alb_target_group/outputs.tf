output "aws_elb_target_group_id" {
    value = "${aws_lb_target_group.this.id}"
}

output "aws_elb_target_group_arn" {
    value = "${aws_lb_target_group.this.arn}"
}

output "aws_elb_target_group_arn_suffix" {
    value = "${aws_lb_target_group.this.arn_suffix}"
}

output "aws_elb_target_group_name" {
    value = "${aws_lb_target_group.this.name}"
}
