/*
  AWS EC2
*/

resource "aws_instance" "bastion-server" {
    ami                     = "${data.aws_ami.distro.id}"
    instance_type           = "${var.aws_bastion_size}"
    count                   = "${length(var.aws_cidr_subnets_public)}"
    associate_public_ip_address = true
    availability_zone       = "${element(slice(data.aws_availability_zones.available.names,0,2),count.index)}"
    subnet_id               = "${element(module.aws-vpc.aws_subnet_ids_public,count.index)}"

    vpc_security_group_ids  = [ "${module.aws-vpc.aws_external_security_group}", "${module.aws-vpc.aws_internal_security_group}" ]

    key_name                = "${var.AWS_SSH_KEY_NAME}"

    tags = "${merge(var.default_tags, map(
      "Name", "bastion${count.index}",
      "Cluster", "${var.aws_cluster_name}",
      "Role", "bastion"
    ))}"
}

/*
  AWS Route53
*/

resource "aws_route53_record" "bastions-group" {
  count                     = "${var.aws_bastion_num}"
  zone_id                   = "${aws_route53_zone.main_private_zone.zone_id}"
  name                      = "bastions.${aws_route53_zone.main_private_zone.name}"
  type                      = "A"
  ttl                       = "300"
  records                   = ["${aws_instance.bastion-server.*.private_ip}"]
}

resource "aws_route53_record" "bastions" {
  count                     = "${var.aws_bastion_num}"
  zone_id                   = "${aws_route53_zone.main_private_zone.zone_id}"
  name                      = "${element(aws_instance.bastion-server.*.tags.Name, count.index)}.${aws_route53_zone.main_private_zone.name}"
  type                      = "A"
  ttl                       = "300"
  records                   = ["${element(aws_instance.bastion-server.*.private_ip, count.index)}"]
}
