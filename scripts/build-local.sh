#!/usr/bin/env bash
set -euo pipefail

DART_BIN="${DART_BIN:-/Users/brntsv/dev/default/bin/dart}"

"${DART_BIN}" --version
"${DART_BIN}" pub get
"${DART_BIN}" pub global run jaspr_cli:jaspr build
