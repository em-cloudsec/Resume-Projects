# Secure AWS Account Baseline

## Purpose
Establish a hardened AWS account foundation by securing the root user, enforcing MFA, creating an IAM admin identity, and applying strong credential policies. This ensures any future workloads begin in a secure, auditable environment.

---

## AWS Services Used
- IAM (Identity and Access Management)
- AWS Account Settings
- (Optional) CloudTrail verification

---

## Acronyms Used
- IAM: Identity and Access Management
- MFA: Multi-Factor Authentication
- ARN: Amazon Resource Name

---

## High-Level Tasks Completed
1. Enabled MFA on the AWS root account.  
2. Verified no root access keys exist.  
3. Created an IAM administrator user (`cl0udadmin`).  
4. Assigned the admin group with AdministratorAccess.  
5. Defined a custom ReadOnly policy for future audit roles.  
6. Configured a strong account-wide password policy.

---

## Config Evidence

```text
IAM User: cl0udadmin
Assigned Groups: admins

MFA Status:
  - IAM User MFA: Enabled
  - MFA Device Type: Virtual MFA (Authenticator App)
  - Root MFA: Enabled
  - Root Access Keys: None

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

