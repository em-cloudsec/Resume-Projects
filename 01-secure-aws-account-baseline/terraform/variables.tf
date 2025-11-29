// variables.tf - inputs for Secure AWS Account Baseline

variable "aws_region" {
  description = "AWS region to use for IAM-related operations (global, but provider still needs a region)."
  type        = string
  default     = "us-west-2"
}

variable "admin_username" {
  description = "IAM username for the break-glass admin account."
  type        = string
  default     = "cl0udadmin"
}

variable "admin_group_name" {
  description = "IAM group name for administrators."
  type        = string
  default     = "admins"
}

variable "readonly_policy_name" {
  description = "Name for the custom read-only audit policy."
  type        = string
  default     = "ReadOnlyAuditPolicy"
}

variable "readonly_policy_description" {
  description = "Description for the custom read-only audit policy."
  type        = string
  default     = "Custom read-only policy for auditing core AWS services."
}
