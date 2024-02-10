#!/bin/bash
# Push git and submodules to upstream

if git status|grep -qF 'nothing to commit, working tree clean'; then
  :
else
  git status
  exit 1
fi

(
  set -e
  set -x

  git push -q
  if test -d src/fi/hg/matrix/   ; then ( cd src/fi/hg/matrix/   && git push -q ); fi
  if test -d src/fi/hg/pipeline/ ; then ( cd src/fi/hg/pipeline/ && git push -q ); fi
  if test -d src/fi/hg/core/       ; then ( cd src/fi/hg/core/       && git push -q ); fi
  if test -d src/fi/hg/ui/       ; then ( cd src/fi/hg/ui/       && git push -q ); fi

) && echo Success || echo FAIL
