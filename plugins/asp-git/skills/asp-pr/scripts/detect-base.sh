#!/bin/sh
# Prints the PR base branch (fork point, not repo default).
#   BASE <branch>  — unambiguous
#   CANDIDATES     — followed by up to 3 lines "<ahead> <branch>"; ask the user
#   NONE           — no candidates
set -e
cur=$(git rev-parse --abbrev-ref HEAD)

# 1. Explicit config (gh reads this key natively).
b=$(git config --get "branch.$cur.gh-merge-base" 2>/dev/null || true)
[ -n "$b" ] && { echo "BASE $b"; exit 0; }

# 2. Upstream pointing to a different branch.
u=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null | sed -E 's@^(origin|upstream)/@@' || true)
[ -n "$u" ] && [ "$u" != "$cur" ] && { echo "BASE $u"; exit 0; }

# 3. Nearest ancestor by commits ahead, across local + origin branches.
# One walk for all refs (git 2.41+): %(ahead-behind:HEAD) is "<only in ref> <only in HEAD>". The second number is
# ref..HEAD = commits since the fork point; 0 means ref already contains HEAD, not a base.
# Lines are "<since fork> <only in ref> <branch>"; on a tie, a ref without own commits sorts first.
all=$(git for-each-ref --format='%(ahead-behind:HEAD) %(refname:short)' refs/heads refs/remotes/origin 2>/dev/null \
  | awk -v cur="$cur" '$3 != cur && $3 != "origin/" cur && $3 != "origin" && $3 !~ /HEAD$/ && $2 > 0 {
      sub(/^origin\//, "", $3); print $2, $1, $3 }' \
  | sort -n -k1,1 -k2,2 | awk '!seen[$3]++')
[ -z "$all" ] && { echo NONE; exit 0; }

set -- $(printf '%s\n' "$all" | head -2)
# Unambiguous if the closest candidate is strictly closer than the next one.
if [ -z "${4:-}" ] || [ "$1" -lt "$4" ]; then echo "BASE $3"; exit 0; fi
# A tie with a sibling branch: HEAD contains the fork point, but not the sibling's own commits.
if [ "$2" -eq 0 ] && [ "$5" -gt 0 ]; then echo "BASE $3"; exit 0; fi
def=$(git symbolic-ref -q --short refs/remotes/origin/HEAD 2>/dev/null | sed 's@^origin/@@' || true)
if [ -n "$def" ] && printf '%s\n' "$all" | awk -v d="$1" -v b="$def" '$1 == d && $3 == b { f = 1 } END { exit !f }'; then
  echo "BASE $def"
else
  echo CANDIDATES; printf '%s\n' "$all" | head -3 | awk '{ print $1, $3 }'
fi
