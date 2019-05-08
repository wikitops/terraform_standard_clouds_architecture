module "ecr" {
  source        = "../modules/ecr"

  name          = "${var.aws_ecr_names}"

  tags          = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}"))}"
}
