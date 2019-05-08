resource "aws_s3_bucket" "this" {
  count         = "${length(var.buckets)}"

  bucket        = "${element(var.buckets, count.index)}"
  acl           = "${var.acl}"
  region        = "${var.region}"
  force_destroy = "${var.force_destroy}"

  versioning {
      enabled = "${var.versioning_enabled}"
  }

  tags          = "${var.tags}"
}
