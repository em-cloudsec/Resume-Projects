# AWS Environment Security Audit – IAM, EC2, VPC, CloudWatch, and CloudTrail

## Purpose
Perform a structured security audit across core AWS services to identify misconfigurations, validate access controls, and collect evidence for compliance and governance.  
This project demonstrates real-world cloud security auditing skills using IAM, EC2, Security Groups, VPC components, CloudWatch metrics, and CloudTrail logs.

This aligns directly with security operations, governance, and compliance roles.

---

## AWS Services Audited
- IAM (Users, Groups, Permissions, MFA, Access Keys)
- Security Groups (Inbound/Outbound rules, segmentation)
- VPC (Subnets, ACLs, routing context)
- EC2 (Instance networking & security posture)
- CloudWatch (Metrics, alarms, resource monitoring)
- CloudTrail (Log integrity, event history, S3 log storage)

---

## Acronyms Used
- IAM: Identity and Access Management  
- SG: Security Group  
- VPC: Virtual Private Cloud  
- ACL: Access Control List  
- EC2: Elastic Compute Cloud  
- S3: Simple Storage Service  
- API: Application Programming Interface  

---

# High-Level Tasks Completed

## 1. IAM Audit
Reviewed:
- User permissions  
- Group assignments  
- MFA status  
- Access key configuration  
- Console password settings  
- Policy inheritance  

### IAM Policy Simulator Evidence (summarized)
```text
DeleteGroup        → Implicitly Denied  
DeleteRolePolicy   → Implicitly Denied  

Reason:
ReadOnlyAccess is attached → no write permissions granted.

Inbound:
- HTTP/HTTPS restricted to 10.10.10.0/24
- RDP allowed only from BastionSG

Outbound:
- Default (allow all)

Inbound:
- SSH (22) and RDP (3389) allowed from 10.10.10.0/24

Outbound:
- Default (allow all)

Inbound:
- SQL access limited to WebServerSG (SG-to-SG reference)

Outbound:
- Restricted except required service paths

Inbound: Allow all  
Outbound: Allow all  

CPUUtilization graph validated
Alarm thresholds viewable
Monitoring enabled on attached EBS volume

Trail Name: LabCloudTrail  
Multi-Region: Enabled  
Log File Validation: Enabled  
S3 Bucket: spl73logs-<random>  

111122223333_CloudTrail_us-east-1_20230314T1535Z_xxxxxx.json.gz
Format: JSON
Contains full API event history

IAM:
  [x] MFA reviewed
  [x] Access keys reviewed
  [x] Permissions validated via Policy Simulator

Security Groups:
  [x] Web Server rules reviewed
  [x] Bastion Host rules reviewed
  [x] SQL Server rules reviewed

VPC:
  [x] Subnets identified
  [x] ACL rules reviewed
  [x] Routing confirmed

CloudWatch:
  [x] EC2 metrics validated
  [x] EBS volume metrics reviewed

CloudTrail:
  [x] Trail located
  [x] S3 log storage validated
  [x] Raw event log viewed
