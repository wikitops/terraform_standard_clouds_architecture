variable "number_of_instances" {
  description = "Number of intances to attach."
}

variable "elb" {
  description = "The name of the ELB."
}

variable "instances" {
  description = "Instances ID to place in the ELB pool."
  type = "list"
}
