# Incident Response Automation – EC2 Quarantine Workflow (SSM + Security Groups)

## Purpose
Implement an automated incident response workflow to isolate potentially compromised EC2 instances using AWS Systems Manager (SSM) Automation.  
This project demonstrates real-world cloud security engineering by replacing an instance’s security groups with a restrictive quarantine SG through a controlled automation runbook.

This proves hands-on experience in:
- Incident response (IR)
- Automation
- Security group management
- EC2/network isolation
- IAM permissions
- Zero-trust containment workflows

This is a standout project for resumes and interviews.

---

## AWS Services Used
- **EC2** – Compute instances  
- **Security Groups** – Network-level controls  
- **SSM Automation** – Workflow orchestration  
- **IAM** – Permissions for automation execution  
- **CloudWatch Logs** – Runbook logging (optional but recommended)  

---

## Acronyms Used
- **IR** – Incident Response  
- **SSM** – AWS Systems Manager  
- **EC2** – Elastic Compute Cloud  
- **SG** – Security Group  
- **API** – Application Programming Interface  

---

## High-Level Tasks Completed
1. Created a dedicated **quarantine security group** with zero ingress/egress  
2. Created an **SSM Automation Runbook** to modify instance network attributes  
3. Added parameters for:
   - `InstanceId`
   - `QuarantineSecurityGroupId`  
4. Implemented ModifyInstanceAttribute API call for SG replacement  
5. Tested runbook against an EC2 instance  
6. Validated IR workflow through SSM logs and instance state checks  

---

## Architecture Summary

### Incident Response Flow
1. Analyst identifies suspicious EC2 behavior  
2. Analyst triggers SSM Automation with:
   - InstanceId  
   - QuarantineSecurityGroupId  
3. Runbook executes ModifyInstanceAttribute  
4. All existing SGs are removed  
5. Quarantine SG is applied  
6. Instance is immediately isolated from all inbound/outbound traffic  

### Why This Architecture Matters
- **Rapid containment** for security incidents  
- **Automation reduces response time**  
- **Consistent, repeatable, auditable** workflows  
- **Zero-touch containment** even without SSH/RDP  

This mirrors real security operations center (SOC) playbooks.

---

## Config Evidence

### Quarantine Security Group Configuration
```json
{
  "Description": "Quarantine security group",
  "GroupName": "quarantine-sg",
  "VpcId": "vpc-xxxxxxx",
  "SecurityGroupIngress": [],
  "SecurityGroupEgress": []
}

schemaVersion: "0.3"
description: "Quarantine EC2 instance by replacing security groups"
parameters:
  InstanceId:
    type: "String"
  QuarantineSecurityGroupId:
    type: "String"

mainSteps:
  - name: quarantineInstance
    action: "aws:executeAwsApi"
    inputs:
      Service: ec2
      Api: ModifyInstanceAttribute
      InstanceId: "{{ InstanceId }}"
      Groups:
        - "{{ QuarantineSecurityGroupId }}"

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:ModifyInstanceAttribute",
        "ec2:DescribeInstances"
      ],
      "Resource": "*"
    }
  ]
}

Quarantine SG:
  [x] No inbound rules
  [x] No outbound rules
  [x] Attached to isolated instance

SSM Automation:
  [x] Runbook executed successfully
  [x] IAM permissions validated
  [x] CloudWatch Logs show execution steps
  [x] Instance confirmed isolated after run
