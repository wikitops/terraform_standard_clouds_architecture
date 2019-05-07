/*
* Cluster default inventory file
*/

data "template_file" "cluster" {
  template = "${file("../templates/inventory/simple_cluster.tpl")}"

  vars {
    public_ip_address_bastion = "${join("\n", formatlist("%s.%s ansible_host=%s", aws_instance.bastion-server.*.tags.Name, var.route53_private_domain, aws_instance.bastion-server.*.public_ip))}"
    connection_strings_master = "${join("\n", formatlist("%s.%s ansible_host=%s", aws_instance.master.*.tags.Name, var.route53_private_domain, aws_instance.master.*.private_ip))}"
    connection_strings_node   = "${join("\n", formatlist("%s.%s ansible_host=%s", aws_instance.worker.*.tags.Name, var.route53_private_domain, aws_instance.worker.*.private_ip))}"
    list_master               = "${join("\n", formatlist("%s.%s", aws_instance.master.*.tags.Name, var.route53_private_domain))}"
    list_node                 = "${join("\n", formatlist("%s.%s", aws_instance.worker.*.tags.Name, var.route53_private_domain))}"
  }
}

resource "local_file" "cluster" {
  content     = "${data.template_file.cluster.rendered}"
  filename = "simple_cluster.inventory"
}

/*
* SSH Config default file
*/

data "template_file" "ssh_config" {
  template                    = "${file("../templates/ssh-bastion.config.tpl")}"

  vars {
    public_ip_address_bastion = "${aws_instance.bastion-server.0.public_ip}"
    list_master               = "${join(" ", aws_instance.master.*.private_ip)}"
    list_node                 = "${join(" ", aws_instance.worker.*.private_ip)}"
    default_user              = "${var.default_user}"
  }
}


resource "local_file" "ssh_config" {
  content     = "${data.template_file.ssh_config.rendered}"
  filename = "ssh-bastion.config"
}
