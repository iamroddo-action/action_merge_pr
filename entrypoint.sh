#!/usr/bin/bash
set -u

if [ "$GITHUB_EVENT_NAME" != "pull_request" ]; then
  echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
  exit 0
fi

echo "::debug::The GH host is '$GH_HOST'"

# GITHUB_EVENT_TYPE=$(jq --raw-output .action $GITHUB_EVENT_PATH)

# if [ "$GITHUB_EVENT_TYPE" != "opened" ] || [ "$GITHUB_EVENT_TYPE" != "reopened" ] ; then
#   echo "::debug::The event type was '$GITHUB_EVENT_TYPE'"
#   exit 0
# fi

exit 0
