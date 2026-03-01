#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DART_BIN="${DART_BIN:-dart}"
PORT="${PORT:-8080}"

cd "${PROJECT_ROOT}"

"${DART_BIN}" --version
"${DART_BIN}" pub get
"${DART_BIN}" pub global run jaspr_cli:jaspr serve --port "${PORT}"
