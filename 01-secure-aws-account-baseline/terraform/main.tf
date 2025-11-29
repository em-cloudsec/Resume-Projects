// main.tf - Secure AWS Account Baseline

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

#############################
# IAM Admin Group & User
#############################

resource "aws_iam_group" "admin_group" {
  name = var.admin_group_name
}

resource "aws_iam_user" "admin_user" {
  name          = var.admin_username
  force_destroy = false
}

resource "aws_iam_user_group_membership" "admin_membership" {
  user = aws_iam_user.admin_user.name

  groups = [
    aws_iam_group.admin_group.name
  ]
}

# Attach AWS managed AdministratorAccess policy to the admin group
resource "aws_iam_group_policy_attachment" "admin_group_admin_policy" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#############################
# Account Password Policy
#############################

resource "aws_iam_account_password_policy" "account_password_policy" {
  minimum_password_length        = 12
  require_lowercase_characters   = true
  require_uppercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
  hard_expiry                    = false
  max_password_age               = 0          # 0 = no expiration
  password_reuse_prevention      = 24
}

#############################
# Custom Read-Only Audit Policy
#############################

data "aws_iam_policy_document" "readonly_audit_doc" {
  statement {
    sid = "ReadOnlyAccess"

    actions = [
      "ec2:Describe*",
      "s3:Get*",
      "s3:List*",
      "iam:List*",
      "iam:Get*",
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetTrailStatus",
      "logs:Describe*",
      "logs:Get*",
      "config:Describe*",
      "config:Get*",
      "organizations:Describe*"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "readonly_audit_policy" {
  name        = var.readonly_policy_name
  description = var.readonly_policy_description
  policy      = data.aws_iam_policy_document.readonly_audit_doc.json
}

# Note:
# In the future, you can attach this policy to a dedicated "audit" IAM role
# for read-only auditing, cross-account roles, or federated identities.
