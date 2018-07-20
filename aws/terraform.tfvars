#--------------------------
# Amazon Web Services
#--------------------------

# Cloud provider name
cloud_provider_name = "Amason AWS"
cloud_provider_shortname = "AWS"
environment_name = "Proof Of Concept"
environment_shortname = "POC"

# Access Key
AWS_ACCESS_KEY_ID = "YOUR_AWS_ACCESS_KEY"

# Secret Key
AWS_SECRET_ACCESS_KEY = "YOUR_AWS_SECRET_KEY"

# EC2 SSHKey Name
AWS_SSH_KEY_NAME = "YOUR_AWS_KEY_NAME"

# Region
AWS_DEFAULT_REGION = "ca-central-1"

# Global Name
aws_cluster_name = "main"

# VPC Vars
aws_vpc_cidr_block = "10.250.192.0/18"
aws_cidr_subnets_private = ["10.250.192.0/20","10.250.208.0/20"]
aws_cidr_subnets_public = ["10.250.224.0/20","10.250.240.0/20"]

# Bastion Host
aws_bastion_num = 2
aws_bastion_size = "t2.micro"

# Cluster
aws_master_num = 3
aws_master_size = "t2.medium"

aws_worker_num = 4
aws_worker_size = "t2.medium"

# Default SSH User
default_user = "ubuntu"

# Default resources tags
default_tags = {
 Env = "poc"
 Owner = "admin"
 Automate = "terraform"
 Autoscale = "false"
}
