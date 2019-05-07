variable "instance_profile_name" {
  description = "The profile's name. If omitted, Terraform will assign a random, unique name."
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  default     = 3600
}

variable "policy_actions" {
  description = "A list of actions that this statement either allows or denies."
  type        = "list"
}

variable "policy_effect" {
  description = "Either 'Allow' or 'Deny', to specify whether this statement allows or denies the given actions."
  default     = "Allow"
}

variable "policy_identifiers" {
  description = "ARNs of AWS entities who can assume these roles"
  default     = ["ec2.amazonaws.com"]
  type        = "list"
}

variable "policy_sid" {
  description = "An ID for the policy statement."
  default     = ""
}

variable "policy_type" {
  description = "A nested configuration block (described below) specifying a resource (or resource pattern) to which this statement applies."
  default     = "Service"
}

variable "role_name" {
  description = "IAM role with admin access"
}

variable "role_path" {
  description = "Path of admin IAM role"
  default     = "/"
}
