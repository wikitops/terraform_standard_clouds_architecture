#--------------------------
# Amazon Web Services
#--------------------------

# Cloud provider name
cloud_provider_name = "Amazon AWS"
cloud_provider_shortname = "AWS"
environment_name = "Proof Of Concept"
environment_shortname = "POC"

# Access Key
AWS_ACCESS_KEY_ID = "AKIAZAFGYYWA4XZKEWG3"

# Secret Key
AWS_SECRET_ACCESS_KEY = "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"

# EC2 SSH Key Name
AWS_SSH_KEY_NAME = "ngiron"

# Region
AWS_DEFAULT_REGION = "ca-central-1"

# Default Rout53 domain to create
route53_private_domain = "ca.treeptik.internal"

# Global Name
aws_cluster_name = "treeptik"

# VPC Vars
aws_vpc_cidr_block = "10.250.192.0/18"
aws_cidr_subnets_private = ["10.250.192.0/20","10.250.208.0/20"]
aws_cidr_subnets_public = ["10.250.224.0/20","10.250.240.0/20"]

# Bastion Host
aws_bastion_num = 2
aws_bastion_type = "t2.micro"

# Cluster
aws_master_num = 3
aws_master_type = "t2.medium"

aws_worker_num = 4
aws_worker_type = "t2.medium"

# Default SSH User
default_user = "ubuntu"

# Default resources tags
default_tags = {
 Env = "poc"
 Owner = "admin"
 Automate = "terraform"
 Autoscale = "false"
}
