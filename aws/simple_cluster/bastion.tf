/*
  AWS EC2
*/

resource "aws_instance" "bastion-server" {
    ami                       = "${data.aws_ami.distro.id}"
    instance_type             = "${var.aws_bastion_type}"
    count                     = "${length(var.aws_cidr_subnets_public)}"
    associate_public_ip_address = true
    availability_zone         = "${element(slice(data.aws_availability_zones.available.names,0,2),count.index)}"
    subnet_id                 = "${element(module.vpc.subnet_ids_public,count.index)}"

    vpc_security_group_ids    = [ "${module.sg-external-ingress-ssh.sg_id}", "${module.sg-internal-egress-all.sg_id}", "${module.sg-internal-ingress-all.sg_id}" ]

    key_name                  = "${var.AWS_SSH_KEY_NAME}"

    tags = "${merge(var.default_tags, map(
      "Name", "${var.aws_cluster_name}-bastion${count.index}",
      "Cluster", "${var.aws_cluster_name}",
      "Role", "bastion"
    ))}"
}

/*
  AWS Route53
*/

resource "aws_route53_record" "bastions-group" {
  zone_id                     = "${aws_route53_zone.main_private_zone.zone_id}"
  name                        = "bastions.${aws_route53_zone.main_private_zone.name}"
  type                        = "A"
  ttl                         = "300"
  records                     = ["${aws_instance.bastion-server.*.private_ip}"]
}

resource "aws_route53_record" "bastions" {
  count                       = "${var.aws_bastion_num}"
  zone_id                     = "${aws_route53_zone.main_private_zone.zone_id}"
  name                        = "${element(aws_instance.bastion-server.*.tags.Name, count.index)}.${aws_route53_zone.main_private_zone.name}"
  type                        = "A"
  ttl                         = "300"
  records                     = ["${element(aws_instance.bastion-server.*.private_ip, count.index)}"]
}

/*
* ELB
*/
module "elb-bastion" {
  source                      = "../modules/elb"

  name                        = "${var.aws_cluster_name}-bastion"

  availability_zones          = "${slice(data.aws_availability_zones.available.names,0,2)}"
  subnets                     = "${module.vpc.subnet_ids_public}"
  security_groups             = ["${module.sg-external-ingress-web.sg_id}"]

  instance_port               = 80
  instance_protocol           = "HTTP"
  lb_port                     = 8080
  lb_protocol                 = "HTTP"

  target                      = "HTTP:80/" # Healthcheck

  default_tags                = "${var.default_tags}"
}

module "elb_attachment" {
  source                      = "../modules/elb_attachment"

  number_of_instances         = "${var.aws_bastion_num}"

  elb                         = "${module.elb-bastion.elb_id}"
  instances                   = "${aws_instance.bastion-server.*.id}"
}
