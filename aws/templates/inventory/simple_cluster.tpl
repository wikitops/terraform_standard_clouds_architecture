[all]
${connection_strings_master}
${connection_strings_node}
${public_ip_address_bastion}

[bastion]
${public_ip_address_bastion}

[master]
${list_master}

[node]
${list_node}

[cluster:children]
node
master
