module "s3_bucket" {
  source        = "../modules/s3_bucket"

  buckets       = "${var.aws_s3_buckets}"
  region        = "${var.AWS_DEFAULT_REGION}"

  tags          = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}"))}"
}
