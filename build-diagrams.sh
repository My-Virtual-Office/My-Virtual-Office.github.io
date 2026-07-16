#!/usr/bin/env bash
# Render doc/diagrams/*.mmd -> doc/assets/diagrams/*.svg with the bright docs theme.
# The .mmd files are the source of truth; SVGs are generated (safe to regenerate).
# Uses the system chromium so mermaid-cli doesn't download its own.
set -euo pipefail
cd "$(dirname "$0")"
MMDC="${MMDC:-$(command -v mmdc || true)}"
[ -z "$MMDC" ] && { echo "mmdc not found (npm i @mermaid-js/mermaid-cli)"; exit 1; }
export PUPPETEER_EXECUTABLE_PATH="${PUPPETEER_EXECUTABLE_PATH:-$(command -v chromium || command -v chromium-browser)}"
echo '{"args":["--no-sandbox","--disable-gpu"]}' > /tmp/pptr-docs.json
for f in diagrams/*.mmd; do
  n="$(basename "$f" .mmd)"
  "$MMDC" -i "$f" -o "assets/diagrams/$n.svg" -c diagrams/mermaid-config.json -b transparent -p /tmp/pptr-docs.json --quiet
  echo "  assets/diagrams/$n.svg"
done
