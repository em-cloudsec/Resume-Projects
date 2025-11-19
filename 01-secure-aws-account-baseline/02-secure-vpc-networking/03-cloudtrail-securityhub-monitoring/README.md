# CloudTrail & Security Hub – Centralized Logging, Compliance, and Security Monitoring

## Purpose
Deploy and validate centralized AWS security monitoring using CloudTrail and Security Hub.  
This project demonstrates how to enable multi-region logging, enforce compliance baselines (CIS & AWS Foundational Security Best Practices), analyze security findings, and establish an auditable monitoring foundation for any AWS environment.

This is one of the most important skills for cloud & security engineers because it covers detection, compliance, and operational visibility.

---

## AWS Services Used
- **CloudTrail** – API logging and audit visibility  
- **Security Hub** – Security posture management & findings aggregation  
- **S3** – Central log storage bucket  
- **CloudWatch Logs** – Optional log delivery integration  
- **IAM** – Permissions for logging & monitoring  

---

## Acronyms Used
- **CIS** – Center for Internet Security  
- **API** – Application Programming Interface  
- **S3** – Simple Storage Service  
- **AWS FSBP** – AWS Foundational Security Best Practices  
- **ARN** – Amazon Resource Name  

---

## High-Level Tasks Completed
1. Enabled **CloudTrail** in multi-region mode  
2. Created a dedicated **S3 bucket** for log storage  
3. Enabled **log file validation** (integrity checks)  
4. Verified CloudTrail is capturing all management API events  
5. Enabled **Security Hub**  
6. Activated two key standards:
   - CIS AWS Foundations Benchmark
   - AWS Foundational Security Best Practices  
7. Reviewed and documented sample findings  
8. Validated logging & security posture via AWS console checks  

---

## Architecture Summary

### Logging Architecture
- CloudTrail records every **management API call** across the account  
- Logs delivered to **S3** with optional CloudWatch integration  
- Log integrity validation ensures logs cannot be tampered with  
- Multi-region mode ensures no “blind spots”  

### Monitoring & Compliance Architecture
Security Hub aggregates:
- CloudTrail events  
- GuardDuty (if enabled in future)  
- IAM misconfiguration findings  
- S3 public access issues  
- Vulnerable configurations  
- CIS + FSBP violations  

Security Hub becomes the **single pane of glass** for security posture.

---

## Config Evidence

### CloudTrail Configuration
```json
{
  "Name": "OrganizationTrail",
  "S3BucketName": "cloudtrail-log-bucket-example",
  "EnableLogFileValidation": true,
  "IsMultiRegionTrail": true
}

{
  "Standards": [
    {
      "StandardsArn": "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
    },
    {
      "StandardsArn": "arn:aws:securityhub:::ruleset/aws-foundational-security-best-practices/v/1.0.0"
    }
  ]
}

Finding: IAM Access Keys older than 90 days

Resource Type: IAM User
Severity: Medium
Detected By: Security Hub (FSBP rule)
Recommendation: Rotate keys and enforce lifecycle controls

CloudTrail Status: Enabled
Multi-Region: Enabled
Log File Validation: Enabled
S3 Delivery: Successful
Recent Events: Confirmed
