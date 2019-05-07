resource "aws_lb_target_group" "this" {
  name                        = "${var.name}"
  # name_prefix                 = "${var.name_prefix}"

  vpc_id                      = "${var.vpc_id}"
  target_type                 = "${var.target_type}"

  port                        = "${var.port}"
  protocol                    = "${var.protocol}"
  slow_start                  = "${var.slow_start}"

  health_check {
    healthy_threshold         = "${var.healthy_threshold}"
    interval                  = "${var.interval}"
    matcher                   = "${var.matcher}"
    path                      = "${var.path}"
    port                      = "${var.port_healthcheck}"
    protocol                  = "${var.protocol}"
    timeout                   = "${var.timeout}"
    unhealthy_threshold       = "${var.unhealthy_threshold}"
  }

  tags = "${merge(var.default_tags, map(
    "Name", "${var.name}"
  ))}"
}
