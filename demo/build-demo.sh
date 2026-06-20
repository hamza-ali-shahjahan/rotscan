#!/usr/bin/env bash
# Builds a throwaway repo set with deliberately-planted rot, so rotscan has
# something to find when recording the demo GIFs. Everything lands in
# .demo-tmp/ (gitignored). The "secret" is the AWS-documented EXAMPLE key,
# assembled from two pieces so the literal token never sits in this repo
# (a repo whose whole job is finding committed secrets shouldn't contain one).
#
#   bash demo/build-demo.sh
set -e
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROOT="$REPO/.demo-tmp"
rm -rf "$ROOT"; mkdir -p "$ROOT"

FAKE_AWS='AKIA''IOSFODNN7EXAMPLE'   # AWS docs' example key, split so it isn't a contiguous token here

init() { (cd "$ROOT/$1"; git init -q; git config user.email d@d; git config user.name demo); }
seal() { (cd "$ROOT/$1"; git add -A; git commit -qm init -q); }

# ── checkout-api : 4 links · 1 secret · 3 dead · 1 dep  (the messy flagship) ──
mkdir -p "$ROOT/checkout-api"/{docs,src,assets,public}; init checkout-api
R="$ROOT/checkout-api"
cat > "$R/README.md" <<'MD'
# checkout-api

- [Setup guide](docs/SETUP.md)
- [API reference](docs/API.md)
- [Architecture](docs/architecture.md)
- [Environment](.env)
MD
echo "# api" > "$R/docs/api.md"                         # lowercase: README's docs/API.md = case mismatch
printf 'const AWS_KEY = "%s";\n' "$FAKE_AWS" > "$R/src/config.ts"
echo "DATABASE_URL=postgres://localhost/app" > "$R/.env"
echo ".env" > "$R/.gitignore"
printf 'PNG' > "$R/assets/old-logo.png"
printf 'JPG' > "$R/public/hero-v1.jpg"
printf 'PNG' > "$R/docs/diagram-draft.png"
cat > "$R/package.json" <<'JSON'
{ "name": "checkout-api", "version": "1.0.0",
  "dependencies": { "zod": "^3.23.0", "@acme/ghost-sdk": "^1.2.0" } }
JSON
seal checkout-api

# ── web-dashboard : 3 links · 1 dead ──
mkdir -p "$ROOT/web-dashboard/img"; init web-dashboard
R="$ROOT/web-dashboard"
cat > "$R/README.md" <<'MD'
# web-dashboard
- [Components](docs/components.md)
- [Theming](docs/theme.md)
- [Deploy](deploy/README.md)
MD
printf 'PNG' > "$R/img/screenshot-old.png"
seal web-dashboard

# ── marketing-site : 2 links · 1 dep ──
mkdir -p "$ROOT/marketing-site"; init marketing-site
R="$ROOT/marketing-site"
cat > "$R/README.md" <<'MD'
# marketing-site
- [Brand](brand/guide.md)
- [Pages](content/pages.md)
MD
cat > "$R/package.json" <<'JSON'
{ "name": "marketing-site", "version": "1.0.0",
  "dependencies": { "@foo/missing-ui": "^0.4.0" } }
JSON
seal marketing-site

# ── internal-cli : 1 secret · 1 dep ──
mkdir -p "$ROOT/internal-cli"; init internal-cli
R="$ROOT/internal-cli"
echo "# internal-cli" > "$R/README.md"
printf 'export const KEY = "%s";\n' "$FAKE_AWS" > "$R/auth.ts"
cat > "$R/package.json" <<'JSON'
{ "name": "internal-cli", "version": "1.0.0",
  "dependencies": { "@bar/no-such-lib": "^2.0.0" } }
JSON
seal internal-cli

# ── design-tokens : clean (contrast) ──
mkdir -p "$ROOT/design-tokens"; init design-tokens
R="$ROOT/design-tokens"
cat > "$R/README.md" <<'MD'
# design-tokens
See the [changelog](CHANGELOG.md) and [docs](https://example.com/docs).
![logo](logo.svg)
MD
echo "# Changelog" > "$R/CHANGELOG.md"
printf '<svg></svg>' > "$R/logo.svg"
cat > "$R/package.json" <<'JSON'
{ "name": "design-tokens", "version": "1.0.0", "dependencies": { "zod": "^3.23.0" } }
JSON
seal design-tokens

echo "built 5 demo repos under $ROOT"
