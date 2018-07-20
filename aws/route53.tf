resource "aws_route53_zone" "main_private_zone" {
  name    = "${var.route53_private_domain}"
  vpc_id  = "${module.aws-vpc.aws_vpc_id}"

  tags {
    Owner = "admin"
  }
}
