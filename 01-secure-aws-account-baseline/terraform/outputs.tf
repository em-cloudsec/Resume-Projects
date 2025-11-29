// outputs.tf - Secure AWS Account Baseline

output "admin_user_name" {
  description = "Name of the IAM administrator user that was created."
  value       = aws_iam_user.admin_user.name
}

output "admin_group_name" {
  description = "Name of the IAM admin group."
  value       = aws_iam_group.admin_group.name
}

output "readonly_audit_policy_arn" {
  description = "ARN of the custom read-only audit IAM policy."
  value       = aws_iam_policy.readonly_audit_policy.arn
}

output "password_policy_min_length" {
  description = "Minimum password length enforced for the account."
  value       = aws_iam_account_password_policy.account_password_policy.minimum_password_length
}
