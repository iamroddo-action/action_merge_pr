#!/usr/bin/bash
set -u

if [ "$GITHUB_EVENT_NAME" != "pull_request" ]; then
  echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
  exit 0
fi

GH_HOST=$INPUT_HOST
echo "::debug::GITHUB_EVENT_PATH is '$GITHUB_EVENT_PATH'"

REPO=$(jq --raw-output .action $GITHUB_EVENT_PATH)
echo "::debug::The GH repo is '$REPO'"

exit 0
