Host ${bastion_public_ip}
  Hostname ${bastion_public_ip}
  StrictHostKeyChecking no
  ControlMaster auto
  ControlPersist 5m

# Host [OPTIONAL LIST OF NODES]
# ProxyCommand ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -W %h:%p ${default_user}@${bastion_public_ip}
