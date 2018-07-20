# Terraform : Standard Architecture

The aim of this project is to deploy the same simple architecture on any cloud thanks to Terraform.

## Description

The idea is to easily deploy a simple secure architecture on the main cloud providers to be able to test some tools or feature. Terraform is recommanded because it is reall simple to create, update and destroy everything whith that tool.

The project respect some global principles like :

* One virtual private cloud using all the availability zones
* Two different network : one public and one private
* The public network can be access from Internet but the private cannot
* A cluster of Bastion server is deployed to access the private network securely
* The private network can access Internet throw a NAT Gateway deployed in the public network
* The network rules are managed by security groups

This schema show the target architecture that the Terraform plan should deploy :

![AWS Infrastructure with Terraform](https://github.com/kubernetes-incubator/kubespray/blob/master/contrib/terraform/aws/docs/aws_kubespray.png)

For more informations about the deployment on each cloud, please refer to the README file present in each directory of this repository.

### Ansible support

To interact easily with Ansible, each plan may create this file : *ansible_inventory_CLOUDNAME

This file is formated like an Ansible inventory host file and can be used by any playbooks.

### SSH Config

To be able to connect on each private servers throw the bastion cluster, a file named : *ssh-bastion.config should be created by each plan to configure the SSH proxy pass.

This file can be used like that :

```
$ ssh -F ./ssh-bastion.config USERNAME@SERVER.IP
```

This file can be used by Ansible to be able to run playbooks directly from your own computer.

## Getting Started

These instructions will get you a copy of the project up and running on the cloud provider of your choice for development and testing purposes.

### Prerequisites

What things you need to run this Terraform plan :

* [Terraform](https://www.terraform.io/)
* Configure the terraform.tfvars file of the cloud provider to be able to manage the architecture throw the API

It's recommended to read the README file in the cloud provider directory to get more information.

### Usage

A good point with Terraform is that you can create, update and destroy all architecture with the same command.

Be aware that you need to be in the Terraform directory to be able to run the commands.

#### Deployment

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

If everything run as expected, you should see something like this :

```
[...]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.
```

#### Destroy

To destroy on what Terraform has created, just run this command :

```
terraform destroy
```

## Author

Member of Wikitops : https://www.wikitops.io/

## Licence

This project is licensed under MIT license. For the full text of the license, see the LICENSE file.
