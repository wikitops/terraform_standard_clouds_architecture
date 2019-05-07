resource "aws_s3_bucket" "this" {
  count  = "${length(var.aws_s3_bucket)}"

  bucket = "${element(var.aws_s3_bucket, count.index)}"

  tags   = "${var.tags}"
}
