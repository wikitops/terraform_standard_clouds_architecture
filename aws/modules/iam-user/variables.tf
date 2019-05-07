variable "name" {
  description = "Desired name for the IAM user"
}

variable "path" {
  description = "Desired path for the IAM user"
  default     = "/"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Used to encrypt password and access key."
  default     = ""
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  default     = true
}

variable "password_length" {
  description = "The length of the generated password"
  default     = 20
}

variable "policy_actions" {
  description = "A list of actions that this statement either allows or denies."
  type        = "list"
}

variable "policy_effect" {
  description = "Either 'Allow' or 'Deny', to specify whether this statement allows or denies the given actions."
  default     = "Allow"
}

variable "policy_name" {
  description = "Name of the policy"
}

variable "policy_resources" {
  description = "A list of resource ARNs that this statement applies to. This is required by AWS if used for an IAM policy."
  default     = ["*"]
  type        = "list"
}
