# Secure AWS Account Baseline

This project establishes foundational security controls including root MFA, IAM least privilege, and account hardening.

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
