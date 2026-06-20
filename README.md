<div align="center">

# 🧹 rotscan

**Find & clear repo rot — one repo, or 100 at once.**

[![npm](https://img.shields.io/npm/v/rotscan?color=cb3837&label=npm)](https://www.npmjs.com/package/rotscan)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![built with Hamzaish](https://img.shields.io/badge/built_with-Hamzaish-d97757.svg)](https://github.com/hamza-ali-shahjahan/hamzaish)

Broken links · committed secrets · dead files · dependencies that 404 on install — the rot that piles up in every repo and only bites at the worst time. `rotscan` finds it, shows you the *extent first*, and cleans it with confirmation.

</div>

---

Every repo quietly accumulates rot:
- 🔗 **Links** that 404 for everyone but you — moved files, gitignored targets, wrong-case paths that pass on macOS and break on Linux CI.
- 🔑 **Secrets** that slipped into a commit.
- 🗑 **Dead files** nothing references.
- 📦 **Dependencies** that don't resolve on npm (the `@inngest/sdk`-doesn't-exist class).

It's invisible day-to-day and surfaces at the worst moment: a reader's 404, a failing CI, a leaked key. **rotscan is the sweep that clears it on purpose.**

## Quickstart

Requires [Bun](https://bun.sh). Until rotscan lands on npm (imminent — then `bunx rotscan` from anywhere), run it straight from the repo:

```bash
git clone https://github.com/hamza-ali-shahjahan/rotscan && cd rotscan

bun rotscan.ts                 # scan the current repo → summary + next steps
bun rotscan.ts ~/code/my-app   # scan a specific repo
bun rotscan.ts --all ~/code    # scan EVERY git repo under a folder — 10 or 100, ranked by rot
bun rotscan.ts --fix .         # plan the cleanup (dry run); add --apply to write it
```

## What you get

- **Summary-first.** A count per category so you see the *extent* before any details — never a wall of output.
- **Multi-repo.** `--all <dir>` sweeps every git repo under a folder and ranks them by rot. Built for the pile of side projects you never audited.
- **Report-first, fix-on-purpose.** `--fix` prints the exact change plan and writes *nothing*; `--apply` makes the edits. It only de-links broken/gitignored text links — secrets, deps, images, and file deletions stay manual (their fix is judgement, not a line-edit).
- **Portable.** Any git repo. No config.

```
$ bunx rotscan

📋  rotscan — my-app

  🔗 Links        3 found
  🔑 Secrets      clean
  🗑  Dead files   1 found
  📦 Deps         clean

  Recommended next steps:
   • 🔗 Links: 3 broken/gitignored link(s) — wrong paths or targets that ship nowhere
   • 🗑 Dead files: 1 orphaned asset — referenced nowhere; safe to prune

  What next?  drill in: --links --files   ·   then clean with: --fix (shows each change first)
```

## Built with Hamzaish

rotscan was born inside **[Hamzaish](https://github.com/hamza-ali-shahjahan/hamzaish)** — an AI-native startup factory — and spun out as a standalone tool. It started as a single guard that caught one broken link in CI, grew into a repo-wide scanner, and became the cleanup *stage* every Hamzaish build reaches for at a milestone. It's useful well beyond the factory, so here it is on its own.

If you like the "find the rot, show the extent, clean with confirmation" discipline, the factory it came from runs on the same idea: build fast, and let small guards keep it honest. → **[github.com/hamza-ali-shahjahan/hamzaish](https://github.com/hamza-ali-shahjahan/hamzaish)**

## Status

**v0.1 — early and honest.** The link, dead-file, and dep scanners are solid; the secrets scanner is high-confidence *pattern* matching (review-grade, not a replacement for `gitleaks`). Node-native distribution (so `npx` works without Bun) is on the roadmap. Issues and PRs welcome — be kind, be generous.

## License

[MIT](LICENSE) © 2026 Hamza Ali.
