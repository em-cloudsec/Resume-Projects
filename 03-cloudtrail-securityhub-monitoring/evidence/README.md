# Evidence – CloudTrail & Security Hub Monitoring

This folder stores proof that CloudTrail and Security Hub were enabled, configured, and validated.

## Examples of evidence to include

From the AWS Console:

- Screenshot: CloudTrail trail configuration (multi-region enabled)
- Screenshot: CloudTrail S3 bucket configuration
- Screenshot: Security Hub "Getting started" or "Dashboard" page
- Screenshot: CIS AWS Foundations Benchmark standard enabled
- Screenshot: AWS Foundational Security Best Practices standard enabled
- Screenshot: Example Security Hub findings (e.g., old access keys, public S3 buckets)

From CLI (optional, later):

- `describe-trails.json` – output of `aws cloudtrail describe-trails`
- `get-trail-status.json` – output of `aws cloudtrail get-trail-status`
- `securityhub-get-findings.json` – output of `aws securityhub get-findings`

From Terraform (later, when used):

- `terraform-plan.txt`
- `terraform-apply-log.txt`

## Purpose

These artifacts support the claim that centralized logging and security posture management were actually implemented and reviewed, not just described in documentation.
