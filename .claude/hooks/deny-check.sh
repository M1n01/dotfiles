#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command')
if [[ "$COMMAND" =~ "rm -rf" || "$COMMAND" =~ "chmod 777" ]]; then
  echo '{"decision": "block", "reason": "Dangerous command detected"}'
  exit 1
fi
exit 0
