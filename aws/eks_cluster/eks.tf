resource "aws_security_group" "eks" {
  name_prefix = "eks_worker_group_${var.eks_cluster_name}"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      var.vpc_cidr_block,
    ]
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "14.0.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_version
  subnets         = module.vpc.private_subnets

  tags = var.default_tags

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "worker_group01"
      instance_type                 = "t3.small"
      asg_desired_capacity          = 3
      additional_security_group_ids = [aws_security_group.eks.id]
    }
  ]
}
