module "ecr" {
  source = "../modules/ecr"

  name = var.ecr_name

  tags = var.default_tags
}
