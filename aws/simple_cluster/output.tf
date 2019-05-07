output "inventory" {
    value = "${data.template_file.cluster.rendered}"
}
