resource "aws_sns_topic" "this" {
  count         = "${length(var.name)}"

  display_name  = "${element(var.name, count.index)}"
  name          = "${element(var.name, count.index)}"
}
