#!/usr/bin/bash
set -u

if [ "$GITHUB_EVENT_NAME" != "pull_request" ]; then
  echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
  exit 0
fi

GH_HOST=$INPUT_HOST
echo "::debug::The GH host is '$GH_HOST'"

REPO=$(jq --raw-output .event.pull_request.base $GITHUB_EVENT_PATH)
echo "::debug::The GH repo is '$REPO'"

exit 0
