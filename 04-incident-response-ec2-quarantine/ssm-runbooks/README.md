# SSM Runbooks – EC2 Quarantine Incident Response

This folder contains AWS Systems Manager (SSM) Automation documents used to isolate EC2 instances during an incident.

Planned contents:

- A runbook that replaces an EC2 instance's security groups with a quarantine security group.
- Future runbooks for:
  - Reversing quarantine
  - Capturing forensic data
  - Tagging instances with incident IDs

Current file:

- `quarantine-ec2.yml` – placeholder for the primary quarantine runbook.
