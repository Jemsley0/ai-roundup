#!/usr/bin/env bash
# Publish one roundup edition or one standalone site change.
#
# Copies the named vault files into content/, builds the site, checks the
# rendered output for the known render defects, then commits, opens a PR and
# squash-merges it. Every step is deterministic; nothing here needs a model.
#
# Usage:
#   tools/publish.sh DATE --body FILE [--coauthor LINE] [--also FILE ...]
#   tools/publish.sh --no-copy --branch NAME --title TITLE --body FILE [--coauthor LINE]
#
#   DATE        Edition date, YYYY-MM-DD. Copies DATE.md, Radar.md and Topics/*.md.
#   --body      Path to the PR body (markdown). Required.
#   --coauthor  Full trailer line to append to the commit message, e.g.
#               "Co-Authored-By: Name <email>". Optional.
#   --also      An older dated note to re-copy (only after a redaction). Repeatable.
#   --no-copy   Skip the vault copy. For repo-only changes (homepage, theme, config).
#   --branch    Branch name. Defaults to roundup-DATE.
#   --title     Commit and PR title. Defaults to "feat: DATE roundup".
#
# The vault path defaults to "$HOME/code/obsidian/AI Roundup Daily".
# Override with ROUNDUP_VAULT. Process Notes.md and Research/ are never copied.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VAULT="${ROUNDUP_VAULT:-$HOME/code/obsidian/AI Roundup Daily}"

DATE=""; BODY=""; COAUTHOR=""; BRANCH=""; TITLE=""; NOCOPY=0; ALSO=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --body)     BODY="$2"; shift 2 ;;
    --coauthor) COAUTHOR="$2"; shift 2 ;;
    --also)     ALSO+=("$2"); shift 2 ;;
    --branch)   BRANCH="$2"; shift 2 ;;
    --title)    TITLE="$2"; shift 2 ;;
    --no-copy)  NOCOPY=1; shift ;;
    -h|--help)  sed -n '2,22p' "$0"; exit 0 ;;
    *)          if [[ -z "$DATE" && "$1" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then DATE="$1"; shift
                else echo "unknown argument: $1" >&2; exit 2; fi ;;
  esac
done

fail() { echo "publish: $*" >&2; exit 1; }

[[ -n "$BODY" ]] || fail "--body FILE is required"
[[ -f "$BODY" ]] || fail "PR body not found: $BODY"
if [[ $NOCOPY -eq 0 ]]; then
  [[ -n "$DATE" ]] || fail "DATE is required unless --no-copy is given"
  [[ -f "$VAULT/$DATE.md" ]] || fail "note not found: $VAULT/$DATE.md"
fi
BRANCH="${BRANCH:-roundup-$DATE}"
TITLE="${TITLE:-feat: $DATE roundup}"
[[ -n "$BRANCH" && "$BRANCH" != "roundup-" ]] || fail "--branch NAME is required with --no-copy"

cd "$REPO"

# Branch off origin/trunk, never a stale local trunk. Refuse to reuse a branch.
git fetch origin --quiet
if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
  [[ "$(git branch --show-current)" == "$BRANCH" ]] || fail "branch $BRANCH already exists; delete it or pass --branch"
else
  git switch --quiet -c "$BRANCH" origin/trunk
fi

# Copy named files only. Never the folder wholesale.
if [[ $NOCOPY -eq 0 ]]; then
  cp "$VAULT/$DATE.md" content/
  cp "$VAULT/Radar.md" content/
  cp "$VAULT/Topics/"*.md content/Topics/
  for f in "${ALSO[@]:-}"; do [[ -n "$f" ]] && cp "$VAULT/$f" content/; done
fi
if compgen -G 'content/Process Notes*' >/dev/null || [[ -d content/Research ]]; then
  fail "local-only files reached content/; remove them before publishing"
fi

# Build and check the rendered output.
npx quartz build >/tmp/quartz-build.log 2>&1 || { tail -20 /tmp/quartz-build.log; fail "quartz build failed"; }
echo "publish: build ok"

# A pair of unescaped $ renders as KaTeX. Fail on any page.
if grep -l 'language-math' public/*.html public/topics/*.html 2>/dev/null; then
  fail "unescaped \$ pair rendered as math (files above); escape as \\\$ in the vault and rerun"
fi
# Broken internal links on the pages this run touched.
CHECK=(public/radar.html public/index.html)
[[ -n "$DATE" ]] && CHECK+=("public/$DATE.html")
for f in "${CHECK[@]}"; do
  [[ -f "$f" ]] || continue
  n=$(grep -c 'internal broken' "$f" || true)
  [[ "$n" -eq 0 ]] || fail "$n broken internal link(s) in $f"
done
# Wikilinks that rendered literally.
if grep -l '\[\[[^]]*\]\]' "${CHECK[@]}" 2>/dev/null; then
  fail "literal [[wikilink]] in rendered output (files above)"
fi
echo "publish: render checks ok"

# Commit, PR, squash-merge.
git add -A
if git diff --cached --quiet; then fail "nothing to commit"; fi
MSG="$TITLE"
[[ -n "$COAUTHOR" ]] && MSG="$MSG"$'\n\n'"$COAUTHOR"
git commit --quiet -m "$MSG"
git push --quiet -u origin "$BRANCH"
PR_URL=$(gh pr create --base trunk --head "$BRANCH" --title "$TITLE" --body-file "$BODY")
echo "publish: opened $PR_URL"
gh pr merge "$BRANCH" --squash --delete-branch >/dev/null
echo "publish: merged $PR_URL"
