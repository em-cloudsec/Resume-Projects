# Audit Scripts – Secure AWS Account Baseline

This folder contains scripts used to verify that the AWS account baseline is configured as expected.

## Files

- `audit-baseline.sh`  
  Uses the AWS CLI to:
  - Retrieve the IAM account password policy
  - Retrieve the IAM account summary (MFA, key status, etc.)
  - Generate and download the IAM credential report

## Prerequisites

- AWS CLI configured with appropriate IAM permissions
- (Optional) `jq` installed for pretty-printing JSON

## Usage

```bash
cd 01-secure-account-baseline/audit-scripts

# Make the script executable (first time only)
chmod +x audit-baseline.sh

# Run the audit
./audit-baseline.sh
