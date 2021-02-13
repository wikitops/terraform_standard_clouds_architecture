data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

module "bastion_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "bastion-public-access"
  description = "Security group to allow access to Bastion hosts"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-icmp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}

resource "aws_eip" "bastion" {
  vpc      = true
  instance = module.bastion_ec2.id[0]
}

resource "aws_placement_group" "bastion_public" {
  name     = "bastion-public"
  strategy = "cluster"
}

resource "aws_kms_key" "bastion" {
}

resource "aws_network_interface" "bastion" {
  count = 1

  subnet_id = tolist(module.vpc.public_subnets)[count.index]
}

module "bastion_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.16.0"

  instance_count = 1

  name                        = "bastion01"
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.small"
  subnet_id                   = tolist(module.vpc.public_subnets)[0]
  vpc_security_group_ids      = [module.bastion_security_group.this_security_group_id]
  associate_public_ip_address = true
  placement_group             = aws_placement_group.bastion_public.id
  key_name                    = module.key_pair.this_key_pair_key_name

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 20
      encrypted   = true
      kms_key_id  = aws_kms_key.bastion.arn
    }
  ]

  tags = var.default_tags
}

module "bastion_aws_route53_records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "1.6.0"

  zone_id = keys(module.private_route53_zone.this_route53_zone_zone_id)[0]

  records = [
    {
      name    = "bastion01"
      type    = "A"
      ttl     = 3600
      records = [join(",", module.bastion_ec2.private_ip)]
    }
  ]

  depends_on = [module.private_route53_zone]

}
