module "vpc" {
  source                      = "../modules/vpc"

  aws_cluster_name            = "${var.aws_cluster_name}"
  aws_vpc_cidr_block          = "${var.aws_vpc_cidr_block}"
  aws_avail_zones             = "${slice(data.aws_availability_zones.available.names,0,2)}"
  aws_cidr_subnets_private    = "${var.aws_cidr_subnets_private}"
  aws_cidr_subnets_public     = "${var.aws_cidr_subnets_public}"
  default_tags                = "${var.default_tags}"
}
