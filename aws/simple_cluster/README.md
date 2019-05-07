## Treeptik AWS platform

This project will create:
*   VPC with Public and Private Subnets in the Availability Zones
*   Bastion Hosts and NAT Gateways in the Public Subnet
*   A static number (by default 3 masters and 4 workers) of nodes in the Private Subnet distributed over the Availability Zones

### Architecture

Pictured is an AWS Infrastructure created with this Terraform project distributed over two Availability Zones.

![AWS Infrastructure with Terraform](https://github.com/kubernetes-incubator/kubespray/blob/master/contrib/terraform/aws/docs/aws_kubespray.png)

## Getting Started

These instructions will set the project up and running on the AWS account for development and testing purposes.

### Prerequisites

What do you need to run this Terraform plan :

*   An [AWS Account](https://aws.amazon.com/)
*   [Terraform](https://www.terraform.io/) (0.8.7 or newer)
*   Copy the terraform.tf.example to terraform.tfvars and configure it with your AWS credentials
*   The AMI to used in the variables.tf may be updated based on the zones that you want to use

### Usage

A good point with Terraform is that you can create, update and destroy all architecture with the same command.

Be aware that you need to be in the Terraform directory to be able to run the commands.

#### Terraform commands

Terraform needs to init the project :

```
terraform init
```

After initiation, read the plan to know what Terraform is supposed to do :

```
terraform plan
```

If you are agree with it, apply the plan :

```
terraform apply
```

Terraform will asked you to confirm your wish, just answer 'yes' :

```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
```

If all run like it is expected, you should see something like this :

```
[...]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.
```

To destroy what Terraform has created, just run this command :

```
terraform destroy
```

#### Set up the architecture

First, you need to configure the credentials in the terraform.tfvars file to be able to work with the AWS API.

So start by updating `terraform.tfvars` with your data. By default, the Terraform scripts use Ubuntu as base image. If you want to change this behavior, see note "Using other distrib than Ubuntu" below.
If you want to be quick, just edit the AWS credentials part.

```
# Access Key
AWS_ACCESS_KEY_ID = "YOUR_AWS_ACCESS_KEY"

# Secret Key
AWS_SECRET_ACCESS_KEY = "YOUR_AWS_SECRET_KEY"

# EC2 SSH Key Name
AWS_SSH_KEY_NAME = "YOUR_AWS_KEY_NAME"

# Region
AWS_DEFAULT_REGION = "DEFAULT_REGION_TO_USE"
```

If everything is ready, test the Terraform plan to be sure that everything is ok :

```
$ terraform plan
```

Then run the plan to deploy the architecture :

```
$ terraform apply
```

Terraform automatically creates an Ansible Inventory file called `hosts` with the created infrastructure in the directory `inventory`.

***Using other distrib than Ubuntu***

If you want to use another distribution than Ubuntu, you can modify the search filters of the 'data "aws_ami" "distro"' in variables.tf.

For example, to use:

-   Debian Jessie, replace 'data "aws_ami" "distro"' in variables.tf with :

```
data "aws_ami" "distro" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-jessie-amd64-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["379101102735"]
}
```

-   CoreOS, replace 'data "aws_ami" "distro"' in variables.tf with :

```
data "aws_ami" "distro" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CoreOS-stable-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["595879546273"] #CoreOS
}
```

-   Centos 7, replace 'data "aws_ami" "distro"' in variables.tf with :

```
data "aws_ami" "distro" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"]
}
```

## TODO

A list of what we can do to update the plan :

Load Balancing :
*   Add an external loadbalancer in front of the bastion servers and manage the connection with a DNS Route 53 record.
*   Add an internal loadbalancer in front of the master servers and manage the connection with a DNS Route 53 record.

IAM :
*   Create a dedicated user to manage the resources.

Lambda :
*   Deploy the functions to schedule the start / stop of the servers to minimize the costs.

Cloud Watch :
*   Add the monitoring of each resources.

EC2 :
*   Attach volumes to the instances.

## Author

Nicolas GIRON - n.giron@treeptik.ca
