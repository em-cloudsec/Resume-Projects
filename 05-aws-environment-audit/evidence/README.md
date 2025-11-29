# Evidence – AWS Environment Security Audit

This folder stores raw evidence collected during the security audit.

## Examples of evidence to include

From AWS CLI or SDK (future):

- `iam-list-users.json`
- `iam-get-account-summary.json`
- `iam-credential-report.csv`
- `ec2-describe-instances.json`
- `ec2-describe-security-groups.json`
- `ec2-describe-network-acls.json`
- `ec2-describe-route-tables.json`
- `cloudtrail-describe-trails.json`
- `cloudtrail-get-trail-status.json`
- `cloudwatch-describe-alarms.json`

Screenshots (optional):

- IAM console summary
- CloudTrail configuration page
- Security Groups overview
- VPC and subnet layout
- CloudWatch alarms page

## Purpose

These artifacts support the findings recorded in the `report/` folder and demonstrate that the environment was actually audited, not just analyzed in theory.
