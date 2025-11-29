# Evidence – EC2 Quarantine Incident Response

This folder stores proof that the EC2 quarantine workflow was configured and tested.

## Examples of evidence to include

From the AWS Console:

- Screenshot: Quarantine security group with no inbound or outbound rules.
- Screenshot: EC2 instance before quarantine (original security groups).
- Screenshot: EC2 instance after quarantine (only quarantine SG attached).
- Screenshot: SSM Automation execution history showing a successful run.

From CLI (optional, later):

- `describe-instances-before.json`
- `describe-instances-after.json`
- `describe-security-groups-quarantine.json`
- `ssm-automation-execution.json`

From logs:

- CloudWatch Logs excerpt showing SSM Automation step outputs (if logging enabled).

## Purpose

These artifacts support the claim that an incident response workflow was implemented to rapidly isolate EC2 instances during a suspected compromise, using automation rather than manual console actions.
