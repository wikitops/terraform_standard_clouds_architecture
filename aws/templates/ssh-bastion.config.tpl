Host ${public_ip_address_bastion}
  Hostname ${public_ip_address_bastion}
  StrictHostKeyChecking no
  ControlMaster auto
  ControlPersist 5m

Host ${list_node} ${list_master}
  ProxyCommand ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -W %h:%p ${default_user}@${public_ip_address_bastion}
