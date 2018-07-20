variable "cloud_provider_name" {
  description = "Cloud provider name"
}

variable "cloud_provider_shortname" {
  description = "Cloud provider shortname"
}

variable "environment_name" {
  description = "Environment name"
}

variable "environment_shortname" {
  description = "Environment shortname"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Key"
}

variable "AWS_SSH_KEY_NAME" {
  description = "Name of the SSH keypair to use in AWS."
}

variable "AWS_DEFAULT_REGION" {
  description = "AWS Region"
}

//General Cluster Settings

variable "aws_cluster_name" {
  description = "Name of AWS Cluster"
}

data "aws_ami" "distro" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

variable "default_user" {
  description = "Default SSH user to use depending on OS"
}

//AWS VPC Variables

variable "aws_vpc_cidr_block" {
  description = "CIDR Block for VPC"
}

variable "aws_cidr_subnets_private" {
  description = "CIDR Blocks for private subnets in Availability Zones"
  type = "list"
}

variable "aws_cidr_subnets_public" {
  description = "CIDR Blocks for public subnets in Availability Zones"
  type = "list"
}

//AWS EC2 Settings
variable "aws_bastion_num" {
    description = "Number of Bastion Nodes"
}

variable "aws_bastion_size" {
    description = "EC2 Instance Size of Bastion Host"
}

/*
* AWS EC2 Settings
*/
variable "aws_master_num" {
    description = "Number of Master Nodes"
}

variable "aws_master_size" {
    description = "Instance size of Kube Master Nodes"
}

variable "aws_worker_num" {
    description = "Number of Worker Nodes"
}

variable "aws_worker_size" {
    description = "Instance size of Worker Nodes"
}

/*
* AWS Route53
*/
variable "route53_private_domain" {
    description = "Private DNS domain to configure on Route53"
    default = "wikitops.internal"
}

variable "default_tags" {
  description = "Default tags for all resources"
  type = "map"
}
