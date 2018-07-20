output "bastion_ip" {
    value = "${join("\n", aws_instance.bastion-server.*.public_ip)}"
}

output "masters" {
    value = "${join("\n", aws_instance.master.*.private_ip)}"
}

output "workers" {
    value = "${join("\n", aws_instance.worker.*.private_ip)}"
}

output "inventory" {
    value = "${data.template_file.inventory.rendered}"
}

output "default_tags" {
    value = "${var.default_tags}"
}
