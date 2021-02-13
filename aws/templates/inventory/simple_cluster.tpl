[all]
${bastion_hostname}.${dns_domain} ansible_host=${bastion_public_ip}

[bastion]
${bastion_hostname}.${dns_domain} ansible_host=${bastion_public_ip}
