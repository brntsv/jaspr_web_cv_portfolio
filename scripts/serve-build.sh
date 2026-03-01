#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORT="${PORT:-8000}"
BUILD_DIR="${PROJECT_ROOT}/build/jaspr"

if [ ! -d "${BUILD_DIR}" ]; then
  echo "Build not found at ${BUILD_DIR}"
  echo "Run: scripts/build-local.sh"
  exit 1
fi

cd "${BUILD_DIR}"
python3 -m http.server "${PORT}"
