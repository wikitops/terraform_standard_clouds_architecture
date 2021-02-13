## AWS : EKS cluster

This project will create:
* VPC with Public and Private Subnets in the Availability Zones
* Bastion Hosts and NAT Gateways in the Public Subnet
* An EKS cluster in the private zone
* An ECR to store custom images

By default, this plan deploy the architecture in the AWS zone : us-east-1

### Architecture

This schema show the target architecture of this Terraform plan :

![AWS Infrastructure with Terraform](https://github.com/kubernetes-incubator/kubespray/contrib/terraform/aws/docs/aws_kubespray.png)

## Getting Started

These instructions will set the project up and running on the AWS account for development and testing purposes.

### Prerequisites

What do you need to run this Terraform plan :

*   An [AWS Account](https://aws.amazon.com/)
*   [Terraform](https://www.terraform.io/) (0.13.2 or newer)
*   Configure your [local AWS environment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication)

### Usage

A good point with Terraform is that you can create, update and destroy all the architecture with the same command.

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

Terraform will asked you to confirm that you want to execute the plan, just answer 'yes' :

```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
```

If the plan runs as expected, you should see something similar to this :

```
[...]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.
```

To destroy what Terraform has created, just run this command :

```
terraform destroy
```

## Author

Member of Wikitops : https://www.wikitops.io/
