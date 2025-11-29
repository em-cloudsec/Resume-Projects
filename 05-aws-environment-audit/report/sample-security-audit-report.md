# AWS Environment Security Audit – Sample Report

Date: 2025-11-XX  
Environment: [e.g., Personal Lab Account / Test Environment]  

## 1. Scope

- IAM
- Security Groups
- VPC networking (subnets, ACLs, routing)
- EC2 instances
- CloudWatch metrics and alarms
- CloudTrail configuration

## 2. Summary of Findings

- [Example] IAM:
  - MFA enabled for: X out of Y users
  - Root account MFA: Enabled / Disabled
  - Access keys older than 90 days: N

- [Example] Security Groups:
  - SGs with 0.0.0.0/0 allowed on SSH (22): N
  - SGs with 0.0.0.0/0 allowed on RDP (3389): N
  - SGs with unrestricted inbound access: N

- [Example] CloudTrail:
  - Multi-region trail: Enabled / Disabled
  - Log file validation: Enabled / Disabled
  - Logging to S3 bucket: Configured / Not configured

## 3. Detailed Findings

### 3.1 IAM

- Finding: [example] User `alice` has active access keys older than 90 days.  
  Recommendation: Rotate keys and enforce key rotation policy.

- Finding: [example] Root account has no active access keys.  
  Recommendation: Maintain this posture; continue to monitor.

### 3.2 Security Groups

- Finding: [example] SG `web-sg` allows 0.0.0.0/0 on port 80 (HTTP).  
  Recommendation: Acceptable for public web apps; ensure WAF and logging are enabled.

- Finding: [example] SG `db-sg` only allows port 5432 from `app-sg`.  
  Recommendation: Good least-privilege segmentation.

### 3.3 VPC & Networking

- Finding: [example] All subnets have appropriate route tables and no unintended direct internet routes from private subnets.  
  Recommendation: Continue to restrict private subnet access.

### 3.4 CloudWatch

- Finding: [example] EC2 CPU utilization alarms configured for critical workloads.  
  Recommendation: Add status-check failure alarms for higher resilience.

### 3.5 CloudTrail

- Finding: [example] CloudTrail is enabled in all regions with log file validation.  
  Recommendation: Integrate with Security Hub for automated findings.

## 4. Recommendations & Next Steps

- Enforce MFA for all IAM users.
- Remove or restrict overly permissive security group rules.
- Ensure CloudTrail is configured as an organization-level trail (if using AWS Organizations).
- Add periodic automated audits using `audit-env.py` (future implementation).

---

*This is a sample template. As the audit scripts are implemented, this document can be generated or updated automatically.*
