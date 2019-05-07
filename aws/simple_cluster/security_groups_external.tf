/*
* Ingress Web
*/

module "sg-external-ingress-web" {
  source                      = "../modules/security_groups"

  name                        = "${var.aws_cluster_name}-external-ingress-web"
  description                 = "Allow ingress on port HTTP and HTTPS from everywhere"
  vpc_id                      = "${module.vpc.vpc_id}"

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-ingress-web-from-net", "Cluster", "${var.aws_cluster_name}"))}"
}

module "sg-external-ingress-80_rules" {
  source                      = "../modules/security_group_rule"

  security_group_id           = "${module.sg-external-ingress-web.sg_id}"

  type                        = "ingress"
  from_port                   = 80
  to_port                     = 80
  protocol                    = "TCP"
  cidr_blocks                 = ["0.0.0.0/0"]
}

module "sg-external-ingress-443_rules" {
  source                      = "../modules/security_group_rule"

  security_group_id           = "${module.sg-external-ingress-web.sg_id}"

  type                        = "ingress"
  from_port                   = 443
  to_port                     = 443
  protocol                    = "TCP"
  cidr_blocks                 = ["0.0.0.0/0"]
}

/*
* Ingress SSH
*/
module "sg-external-ingress-ssh" {
  source                      = "../modules/security_groups"

  name                        = "${var.aws_cluster_name}-external-ingress-ssh"
  description                 = "Allow ingress on port SSH from everywhere"
  vpc_id                      = "${module.vpc.vpc_id}"

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-ingress-ssh-from-everywhere", "Cluster", "${var.aws_cluster_name}"))}"
}

module "sg-external-ingress-22_rules" {
  source                      = "../modules/security_group_rule"

  security_group_id           = "${module.sg-external-ingress-ssh.sg_id}"

  type                        = "ingress"
  from_port                   = 22
  to_port                     = 22
  protocol                    = "TCP"
  cidr_blocks                 = ["0.0.0.0/0"]
}
