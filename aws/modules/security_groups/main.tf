resource "aws_security_group" "this" {
  name                        = "${var.name}"
  # name_prefix                 = "${var.name_prefix}"
  description                 = "${var.description}"
  vpc_id                      = "${var.vpc_id}"

  tags                        = "${var.tags}"
}
