# Diagrams – EC2 Quarantine Incident Response

This folder will contain diagrams describing the incident response workflow.

Planned diagrams:

- High-level IR flow:
  - Suspicious activity detected
  - Analyst/automation triggers SSM runbook
  - Instance security groups replaced with quarantine SG
- Network view:
  - Normal SG vs. quarantine SG (no ingress/egress)
- Integration points:
  - Potential connections to CloudWatch Alarms, Security Hub, or GuardDuty

Example future file:

- `ec2-quarantine-ir-flow.png`
