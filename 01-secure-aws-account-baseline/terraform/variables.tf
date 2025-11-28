// variables.tf - baseline parameters

variable "account_alias" {
  type        = string
  description = "Account alias for this AWS account."
  default     = "lab-secure-account"
}
