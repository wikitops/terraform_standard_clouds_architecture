module "s3_bucket" {
  source        = "../modules/s3_bucket"

  aws_s3_bucket = "${var.aws_s3_buckets}"
  tags          = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}"))}"
}
