#!/usr/bin/env bash
# trigger-quarantine.sh - placeholder script to start the EC2 quarantine runbook.
#
# In the future, this script can:
# - Call `aws ssm start-automation-execution` with the Automation document name
# - Pass in the target InstanceId and QuarantineSecurityGroupId
#
# For now, this is a structural placeholder to show where IR helper scripts will live.

AUTOMATION_DOC_NAME="${1:-Quarantine-EC2}"
INSTANCE_ID="${2:-i-xxxxxxxxxxxx}"
QUARANTINE_SG_ID="${3:-sg-xxxxxxxxxxxx}"

echo "Placeholder: would trigger Automation document '$AUTOMATION_DOC_NAME' for instance '$INSTANCE_ID' using quarantine SG '$QUARANTINE_SG_ID'."

# Example future command:
# aws ssm start-automation-execution \
#   --document-name "$AUTOMATION_DOC_NAME" \
#   --parameters InstanceId="$INSTANCE_ID",QuarantineSecurityGroupId="$QUARANTINE_SG_ID"
