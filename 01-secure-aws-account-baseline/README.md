#  Secure AWS Account Baseline

## Goal
Establish a hardened baseline for a new AWS account by locking down the root user, creating a dedicated IAM admin identity, and enforcing strong credential policies (passwords + MFA).

---

## AWS Services Used
- IAM (users, groups, policies, MFA)
- AWS Account Settings (password policy)
- (Optional) CloudTrail, if logging was verified

---

## Acronyms Used
- IAM – Identity and Access Management
- MFA – Multi-Factor Authentication
- ARN – Amazon Resource Name
- AWS CLI – AWS Command Line Interface

---

## High-Level Tasks Completed

1. Enabled MFA on the AWS root account.
2. Verified no access keys exist for the root account.
3. Created an IAM administrative user (`cl0udadmin`) or role.
4. Assigned least-privilege admin access to that identity.
5. Created a read-only policy for future audit users.
6. Configured a strong account-level IAM password policy.

---

## Identity Design

- Root user:
  - MFA enabled
  - No access keys
  - Not used for day-to-day operations

- IAM Admin user (example):  
  - Username: `cl0udadmin`  
  - Purpose: Day-to-day administrator instead of root  

### Config Evidence (Example)

```text
IAM User: cl0udadmin
Groups: admins

MFA: Enabled
MFA device: Virtual MFA (e.g., Authenticator app)
Root account: MFA enabled, no access keys

{
  "MinimumPasswordLength": 12,
  "RequireSymbols": true,
  "RequireNumbers": true,
  "RequireUppercaseCharacters": true,
  "RequireLowercaseCharacters": true,
  "AllowUsersToChangePassword": true,
  "ExpirePasswords": false,
  "HardExpiry": false,
  "MaxPasswordAge": 0,
  "PasswordReusePrevention": 24
}

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ReadOnlyAccess",
      "Effect": "Allow",
      "Action": [
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
      ],
      "Resource": "*"
    }
  ]
}
