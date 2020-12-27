#!/usr/bin/bash
set -u

# if [ "$GITHUB_EVENT_NAME" != "pull_request" ]; then
#   echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
#   exit 0
# fi

GH_HOST=$INPUT_HOST
REPO=$(jq --raw-output .pull_request.base.repo.full_name $GITHUB_EVENT_PATH)
REPO_PATH="${GH_HOST}/${REPO}"
echo "::debug::GH_HOST is '$GH_HOST'"
echo "::debug::REPO is '$REPO'"
echo "::debug::REPO_PATH is '$REPO_PATH'"

exit 0
