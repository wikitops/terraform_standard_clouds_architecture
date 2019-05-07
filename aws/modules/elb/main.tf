resource "aws_elb" "this" {
  name                        = "${var.name}-${var.lb_port}"

  # availability_zones          = ["${var.availability_zones}"]
  subnets                     = ["${var.subnets}"]
  security_groups             = ["${var.security_groups}"]

  # access_logs {
  #   bucket                    = "${var.bucket}"
  #   bucket_prefix             = "${var.bucket_prefix}"
  #   enabled                   = "${var.enabled}"
  #   interval                  = "${var.interval_access_log}"
  # }

  listener {
    instance_port             = "${var.instance_port}"
    instance_protocol         = "${var.instance_protocol}"
    lb_port                   = "${var.lb_port}"
    lb_protocol               = "${var.lb_protocol}"
    # ssl_certificate_id        = "${var.ssl_certificate_id}"
  }

  health_check {
    healthy_threshold         = "${var.healthy_threshold}"
    unhealthy_threshold       = "${var.unhealthy_threshold}"
    timeout                   = "${var.timeout}"
    target                    = "${var.target}"
    interval                  = "${var.interval}"
  }

  # instances                   = ["${var.instances}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  tags = "${merge(var.default_tags, map(
    "Name", "${var.name}"
  ))}"
}
