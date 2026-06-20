# Sourced by the VHS tapes. Sets up the demo shell: the `rotscan` command
# (runs this repo's rotscan.ts via bun), the title-card `intro`, a clean prompt,
# and cd into the throwaway repo set built by build-demo.sh. Run tapes from the repo root.
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO/.demo-tmp" 2>/dev/null || cd "$REPO"
rotscan() { bun "$REPO/rotscan.ts" "$@"; }
intro() { cat "$REPO/demo/banner.txt"; }
PS1='~/code $ '
