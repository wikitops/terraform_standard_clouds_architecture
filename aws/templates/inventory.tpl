[all:vars]
cloud_provider_region="${cloud_provider_region}"
cloud_provider_name="${cloud_provider_name}"
cloud_provider_shortname="${cloud_provider_shortname}"
environment_name="${environment_name}"
environment_shortname="${environment_shortname}"
ansible_user="${ansible_user}"

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
