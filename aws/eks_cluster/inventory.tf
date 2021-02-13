locals {
  template_file_ansible = templatefile("../templates/inventory/simple_cluster.tpl", {
    dns_domain        = "lab.wikitops.io"
    bastion_hostname  = module.bastion_ec2.tags[0].Name
    bastion_public_ip = aws_eip.bastion.public_ip
  })

  template_file_ssh_config = templatefile("../templates/ssh-bastion.config.tpl", {
    bastion_public_ip = aws_eip.bastion.public_ip
    default_user      = var.default_user
  })
}

resource "local_file" "ansible" {
  content  = local.template_file_ansible
  filename = "simple_cluster.inventory"
}

resource "local_file" "ssh_config" {
  content  = local.template_file_ssh_config
  filename = "ssh-bastion.config"
}
