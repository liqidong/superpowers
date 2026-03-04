#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
DATE_NOW="$(date +%F)"
ART_DIR="$ROOT_DIR/artifacts"
PKG_NAME="peterlearning-skills-pack-$DATE_NOW.tar.gz"
PKG_PATH="$ART_DIR/$PKG_NAME"

mkdir -p "$ART_DIR"

# Build merged report before packaging
bash "$ROOT_DIR/skills/scripts/build-merged-learning.sh"

# Package skills directory
# Exclude previous archives and temp files if any

tar -czf "$PKG_PATH" -C "$ROOT_DIR" skills
sha256sum "$PKG_PATH" > "$PKG_PATH.sha256"

echo "package: $PKG_PATH"
echo "sha256:  $PKG_PATH.sha256"
