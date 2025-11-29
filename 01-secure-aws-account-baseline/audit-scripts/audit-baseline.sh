#!/usr/bin/env bash
# audit-baseline.sh - Audit key parts of the Secure AWS Account Baseline
# Requires: AWS CLI configured with appropriate IAM permissions.

set -euo pipefail

echo "=== Secure AWS Account Baseline Audit ==="
echo "Region: ${AWS_REGION:-not set (using default)}"
echo

echo "[1] Checking IAM account password policy..."
aws iam get-account-password-policy \
  --output json > password-policy.json

echo "Saved: password-policy.json"
cat password-policy.json | jq '.PasswordPolicy' 2>/dev/null || echo "Install jq to pretty-print JSON."

echo
echo "[2] Getting IAM account summary (MFA, keys, etc.)..."
aws iam get-account-summary \
  --output json > account-summary.json

echo "Saved: account-summary.json"
cat account-summary.json 2>/dev/null || true

echo
echo "[3] Generating IAM credential report (users, keys, passwords)..."
aws iam generate-credential-report >/dev/null 2>&1

# Wait briefly for the report to generate
sleep 5

aws iam get-credential-report \
  --output text \
  --query 'Content' | base64 --decode > credential-report.csv

echo "Saved: credential-report.csv"

echo
echo "=== Audit Complete ==="
echo "Artifacts generated:"
echo "  - password-policy.json"
echo "  - account-summary.json"
echo "  - credential-report.csv"
