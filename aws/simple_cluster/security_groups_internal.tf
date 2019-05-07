/*
* Egress
*/
module "sg-internal-egress-all" {
  source                      = "../modules/security_groups"

  name                        = "${var.aws_cluster_name}-internal-egress-all"
  description                 = "Allow egress on port ALL port to anywhere"
  vpc_id                      = "${module.vpc.vpc_id}"

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-egress-all-to-anywhere", "Cluster", "${var.aws_cluster_name}"))}"
}

module "sg-internal-egress-all_rules" {
  source                      = "../modules/security_group_rule"

  security_group_id           = "${module.sg-internal-egress-all.sg_id}"

  type                        = "egress"
  from_port                   = 0
  to_port                     = 65535
  protocol                    = "-1"
  cidr_blocks                 = ["0.0.0.0/0"]
}

/*
* Ingress all
*/
module "sg-internal-ingress-all" {
  source                      = "../modules/security_groups"

  name                        = "${var.aws_cluster_name}-internal-ingress-all"
  description                 = "Allow ingress on ALL port from everywhere on LAN"
  vpc_id                      = "${module.vpc.vpc_id}"

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-ingress-all-from-lan", "Cluster", "${var.aws_cluster_name}"))}"
}

module "sg-internal-ingress-all_rules" {
  source                      = "../modules/security_group_rule"

  security_group_id           = "${module.sg-internal-ingress-all.sg_id}"

  type                        = "ingress"
  from_port                   = 0
  to_port                     = 65353
  protocol                    = "-1"
  cidr_blocks                 = ["${var.aws_vpc_cidr_block}"]
}
