/*
  AWS EC2
*/

resource "aws_instance" "worker" {
    ami = "${data.aws_ami.distro.id}"
    instance_type = "${var.aws_worker_size}"

    count = "${var.aws_worker_num}"

    availability_zone  = "${element(slice(data.aws_availability_zones.available.names,0,2),count.index)}"
    subnet_id = "${element(module.aws-vpc.aws_subnet_ids_private,count.index)}"

    vpc_security_group_ids = [ "${module.aws-vpc.aws_internal_security_group}" ]

    key_name = "${var.AWS_SSH_KEY_NAME}"


    tags = "${merge(var.default_tags, map(
      "Name", "worker${count.index}",
      "Cluster", "${var.aws_cluster_name}",
      "Role", "worker"
    ))}"
}

/*
  AWS Route53
*/

resource "aws_route53_record" "workers_group" {
  zone_id = "${aws_route53_zone.main_private_zone.zone_id}"
  name    = "workers.${aws_route53_zone.main_private_zone.name}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.worker.*.private_ip}"]
}

resource "aws_route53_record" "workers" {
  count   = "${var.aws_worker_num}"
  zone_id = "${aws_route53_zone.main_private_zone.zone_id}"
  name    = "${element(aws_instance.worker.*.tags.Name, count.index)}.${aws_route53_zone.main_private_zone.name}"
  type    = "A"
  ttl     = "300"
  records = ["${element(aws_instance.worker.*.private_ip, count.index)}"]
}
