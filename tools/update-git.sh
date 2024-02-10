#!/bin/bash
# Update git and submodules from upstream

if git status|grep -qF 'nothing to commit, working tree clean'; then
  :
else
  git status
  exit 1
fi

(
  set -e
  set -x

  git pull -q
  if test -d src/fi/hg/matrix/   ; then ( cd src/fi/hg/matrix/   && git pull -q ); fi
  if test -d src/fi/hg/pipeline/ ; then ( cd src/fi/hg/pipeline/ && git pull -q ); fi
  if test -d src/fi/hg/core/       ; then ( cd src/fi/hg/core/       && git pull -q ); fi
  if test -d src/fi/hg/ui/       ; then ( cd src/fi/hg/ui/       && git pull -q ); fi

) && echo Success || echo FAIL
