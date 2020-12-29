#!/usr/bin/bash
set -u

if [ "$GITHUB_EVENT_NAME" != "pull_request" ]; then
  echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
  exit 0
fi

GH_HOST=$INPUT_HOST
echo "::debug::GH_HOST is '$GH_HOST'"

REPO=$(jq --raw-output .pull_request.base.repo.full_name $GITHUB_EVENT_PATH)
GH_REPO="${GH_HOST}/${REPO}"
echo "::debug::REPO_PATH is '$GH_REPO'"

PR_NUMBER=$(jq --raw-output .number $GITHUB_EVENT_PATH)
echo "::debug::PR_NUMBER is '$PR_NUMBER'"

gh config set prompt disabled
if [ "$GITHUB_EVENT_NAME" != "pull_request" ]; then
OUTPUT=$(gh pr merge $PR_NUMBER --squash -R $GH_REPO 2>&1)
echo "::debug::Output of 'gh pr merge $PR_NUMBER --squash -R $GH_REPO ' is: '$OUTPUT'"

exit 0
