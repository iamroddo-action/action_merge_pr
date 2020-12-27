#!/usr/bin/bash
set -u

# if [ "$GITHUB_EVENT_NAME" != "pull_request" ]; then
#   echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
#   exit 0
# fi

GH_HOST=$INPUT_HOST
REPO=$(jq --raw-output .pull_request.base.repo.full_name $GITHUB_EVENT_PATH)
GH_REPO="${GH_HOST}/${REPO}"
PR_NUMBER=$(jq --raw-output .event.number $GITHUB_EVENT_PATH)

echo "::debug::GH_HOST is '$GH_HOST'"
echo "::debug::REPO_PATH is '$GH_REPO'"
echo "::debug::PR_NUMBER is '$PR_NUMBER'"

exit 0
