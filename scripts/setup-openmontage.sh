#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UPSTREAM_DIR="$ROOT/OpenMontage"

fail() {
  echo
  echo "Setup stopped: $*" >&2
  echo "Read the first error above, fix that issue, then run this script again." >&2
  exit 1
}

echo "OpenMontage Cloud setup"
echo "Workspace: $ROOT"
echo "This script does not configure paid API keys or enable paid services."
echo

for cmd in python3 node npm git make; do
  command -v "$cmd" >/dev/null 2>&1 || fail "Missing required command: $cmd. Rebuild the Codespace using this repository's devcontainer configuration."
done

python3 - <<'PY'
import sys
if sys.version_info < (3, 10):
    raise SystemExit("Python 3.10+ is required.")
print("Python:", sys.version.split()[0])
PY

node -e 'const major = Number(process.versions.node.split(".")[0]); if (major < 18) { console.error("Node.js 18+ is required."); process.exit(1); } console.log("Node.js:", process.versions.node);' || fail "Node.js version is too old."

if ! command -v ffmpeg >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1 && command -v sudo >/dev/null 2>&1; then
    echo "Installing FFmpeg from the Ubuntu/Debian package repository..."
    sudo apt-get update && sudo apt-get install -y ffmpeg || fail "Could not install FFmpeg."
  else
    fail "FFmpeg is missing. Install it in your cloud environment, then rerun this script."
  fi
fi

if [ -d "$UPSTREAM_DIR/.git" ]; then
  echo "Found existing upstream checkout: $UPSTREAM_DIR"
elif [ -e "$UPSTREAM_DIR" ]; then
  fail "$UPSTREAM_DIR already exists but is not a Git checkout. Rename it or inspect it before continuing."
else
  echo "Cloning official OpenMontage repository..."
  git clone https://github.com/calesthio/OpenMontage.git "$UPSTREAM_DIR" || fail "Could not clone OpenMontage."
fi

echo
echo "The upstream setup may download many dependencies and consume Codespaces storage/runtime quota."
echo "It will not make paid API calls by this script, but third-party tools may offer paid features later."
read -r -p "Run upstream 'make setup' now? [y/N] " answer
case "$answer" in
  y|Y|yes|YES)
    cd "$UPSTREAM_DIR"
    make setup || fail "Upstream make setup failed. Read the error and consult the upstream README."
    ;;
  *)
    echo "Skipped dependency installation. When ready, run:"
    echo "  cd '$UPSTREAM_DIR' && make setup"
    ;;
esac

echo
echo "Setup script finished."
echo "Upstream checkout: $UPSTREAM_DIR"
echo "Next: use a compatible AI coding assistant with access to the OpenMontage folder."
echo "For a ₹0 test, do not add paid provider API keys and require approval before any chargeable action."
