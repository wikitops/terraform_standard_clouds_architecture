/*
* Ansible default inventory file
*/

data "template_file" "inventory" {
    template = "${file("${path.module}/templates/inventory.tpl")}"

    vars {
        public_ip_address_bastion = "${join("\n",formatlist("%s ansible_host=%s" , aws_instance.bastion-server.*.tags.Name, aws_instance.bastion-server.*.public_ip))}"
        connection_strings_master = "${join("\n",formatlist("%s ansible_host=%s",aws_instance.master.*.tags.Name, aws_instance.master.*.private_ip))}"
        connection_strings_node = "${join("\n", formatlist("%s ansible_host=%s", aws_instance.worker.*.tags.Name, aws_instance.worker.*.private_ip))}"
        list_master = "${join("\n",aws_instance.master.*.tags.Name)}"
        list_node = "${join("\n",aws_instance.worker.*.tags.Name)}"
        cloud_provider_region = "${var.AWS_DEFAULT_REGION}"
        cloud_provider_name = "${var.cloud_provider_name}"
        cloud_provider_shortname = "${var.cloud_provider_shortname}"
        environment_name = "${var.environment_name}"
        environment_shortname = "${var.environment_shortname}"
        ansible_user = "${var.default_user}"
    }
}

resource "null_resource" "inventories" {
  provisioner "local-exec" {
      command = "echo '${data.template_file.inventory.rendered}' > ansible_inventory"
  }

  triggers {
      template = "${data.template_file.inventory.rendered}"
  }
}

/*
* SSH Config default file
*/

data "template_file" "ssh_config" {
    template = "${file("${path.module}/templates/ssh-bastion.config.tpl")}"

    vars {
        public_ip_address_bastion = "${aws_instance.bastion-server.0.public_ip}"
        list_master = "${join(" ", aws_instance.master.*.private_ip)}"
        list_node = "${join(" ", aws_instance.worker.*.private_ip)}"
        default_user = "${var.default_user}"
    }
}

resource "null_resource" "ssh_config" {
  provisioner "local-exec" {
      command = "echo '${data.template_file.ssh_config.rendered}' > ssh-bastion.config"
  }

  triggers {
      template = "${data.template_file.ssh_config.rendered}"
  }
}
