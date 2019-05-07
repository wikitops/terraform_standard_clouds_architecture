resource "aws_route53_zone" "main_private_zone" {
  name    = "${var.route53_private_domain}"

  vpc {
    vpc_id  = "${module.vpc.vpc_id}"
  }

  tags {
    Owner = "admin"
  }
}
