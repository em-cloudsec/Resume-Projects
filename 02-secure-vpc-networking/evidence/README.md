# Evidence – Secure VPC Networking

This folder stores proof that the VPC networking environment was deployed and validated.

## Examples of evidence to include

From the AWS Console:

- Screenshot: VPC created with correct CIDR (e.g., 10.0.0.0/16)
- Screenshot: Public and private subnets with correct CIDRs
- Screenshot: Internet Gateway attached to the VPC
- Screenshot: NAT Gateway deployed in the public subnet
- Screenshot: Public route table with a 0.0.0.0/0 route to the IGW
- Screenshot: Private route table with a 0.0.0.0/0 route to the NAT Gateway
- Screenshot: VPC Flow Logs configuration (if enabled)

From CLI (optional, later):

- `describe-vpcs.json`
- `describe-subnets.json`
- `describe-route-tables.json`
- `describe-nat-gateways.json`

From Terraform (later, when used):

- `terraform-plan.txt`
- `terraform-apply-log.txt`

## Purpose

These artifacts support resume and interview conversations by showing that the VPC design was actually implemented and validated, not just documented in theory.
