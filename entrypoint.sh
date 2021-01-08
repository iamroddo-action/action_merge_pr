#!/usr/bin/bash
set -u

GH_HOST=$INPUT_HOST
echo "::debug::GH_HOST is '$GH_HOST'"

REPO=$(jq --raw-output .pull_request.base.repo.full_name $GITHUB_EVENT_PATH)
GH_REPO="${GH_HOST}/${REPO}"
echo "::debug::REPO_PATH is '$GH_REPO'"

PR_NUMBER=$(jq --raw-output .pull_request.number $GITHUB_EVENT_PATH)
echo "::debug::PR_NUMBER is '$PR_NUMBER'"

gh config set prompt disabled
OUTPUT=$(gh pr merge $PR_NUMBER --squash -R $GH_REPO 2>&1)
echo "::debug::Output of 'gh pr merge $PR_NUMBER --squash -R $GH_REPO ' is: '$OUTPUT'"

exit 0
