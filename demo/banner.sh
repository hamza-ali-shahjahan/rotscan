#!/usr/bin/env bash
# Regenerates demo/banner.txt — the title-card shown at the start of the hero GIF.
# Needs figlet (`brew install figlet`). The generated banner.txt is committed, so
# re-recording the tapes does NOT require figlet unless you want to change the wordmark.
#
#   bash demo/banner.sh
set -e
export LC_ALL=en_US.UTF-8
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
W=124
WM=$(mktemp); figlet -w 200 -f colossal rotscan | sed 's/[[:space:]]*$//' > "$WM"
MAX=$(awk '{ if (length>m) m=length } END{print m}' "$WM")
PAD=$(( (W - MAX) / 2 )); [ $PAD -lt 0 ] && PAD=0
SP=$(printf '%*s' "$PAD" '')
center() { local s="$1" len p; len=$(printf '%s' "$s" | wc -m | tr -d ' '); p=$(( (W-len)/2 )); [ $p -lt 0 ] && p=0; printf '%*s%s\n' "$p" '' "$s"; }
{
  printf '\n\n\n\n\n\n\n\n\n'
  while IFS= read -r l; do printf '%s%s\n' "$SP" "$l"; done < "$WM"
  printf '\n'
  center "find & clear repo rot"
  center "broken links · committed secrets · dead files · dead deps"
  center "one repo, or a hundred  —  report-first, fix on purpose"
  printf '\n'
  center "▸ watch it work"
} > "$REPO/demo/banner.txt"
rm -f "$WM"
echo "wrote $REPO/demo/banner.txt"
