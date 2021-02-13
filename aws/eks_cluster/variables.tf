# GLOBAL | Get all the availability zones in the default region
data "aws_availability_zones" "available" {}

# GLOBAL | Get all the availability zones in the default region
variable "default_tags" {
  default = {
    Owner         = "wikitops"
    Environment   = "lab"
    ProvisionedBy = "terraform"
  }
  type = map(string)
}

# INVENTORY | Default SSH user
variable "default_user" {
  default     = "ec2-user"
  description = "Default SSH user to use depending on the operating system"
}

# VPC | Name
variable "vpc_name" {
  default = "lab01"
}

# VPC | Default CIDR block
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

# KEYPAIR | Name
variable "keypair_name" {
  default = "wikitops"
}

# ECR | Repository name
variable "ecr_name" {
  default = "lab"
}

# EKS | Cluster name
variable "eks_cluster_name" {
  default = "lab-eks"
}

# EKS | Version
variable "eks_version" {
  default = "1.18"
}
