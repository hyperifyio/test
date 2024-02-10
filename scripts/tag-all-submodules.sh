#!/bin/bash
cd "$(dirname "$0")/.."
TAG="$1"
MESSAGE="$2"
if test "x$TAG" != x && test "x$MESSAGE" != x; then
  :
else
  echo 'USAGE: ./scripts/tag-all-submodules.sh TAG MESSAGE' >&2
  exit 1
fi
set -e

cat .gitmodules |grep -F path|awk '{print $3}'|while read DIR; do
  (
    cd $DIR
    set -e
    git tag -a "$TAG" -m "$MESSAGE"
    git push origin "$TAG"
  )
done
