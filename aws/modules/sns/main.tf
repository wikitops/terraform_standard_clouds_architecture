resource "aws_sns_topic" "this" {
  count = "${length(var.name)}"

  display_name  = "${var.name}"
  name          = "${var.name}"
}
