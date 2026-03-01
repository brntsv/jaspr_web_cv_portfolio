#!/usr/bin/env bash
set -euo pipefail

DART_VERSION="${DART_VERSION:-3.11.0}"
MIN_VERSION="${MIN_VERSION:-3.8.0}"
PROJECT_ROOT="$(pwd)"

needs_install() {
  if ! command -v dart >/dev/null 2>&1; then
    return 0
  fi

  local version
  version="$(dart --version 2>&1 | awk '{print $4}')"
  if [ -z "${version}" ]; then
    return 0
  fi

  local smallest
  smallest="$(printf '%s\n' "${MIN_VERSION}" "${version}" | sort -V | head -n 1)"
  if [ "${smallest}" != "${MIN_VERSION}" ]; then
    return 0
  fi

  return 1
}

if needs_install; then
  echo "Installing Dart SDK ${DART_VERSION} (min ${MIN_VERSION})..."
  DART_ZIP="/tmp/dart-sdk.zip"
  curl -fsSL "https://storage.googleapis.com/dart-archive/channels/stable/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip" -o "${DART_ZIP}"
  rm -rf "${PROJECT_ROOT}/.dart-sdk"
  unzip -q "${DART_ZIP}" -d "${PROJECT_ROOT}/.dart-sdk"
  export PATH="${PROJECT_ROOT}/.dart-sdk/dart-sdk/bin:${PATH}"
fi

export PUB_CACHE="${PROJECT_ROOT}/.pub-cache"
export PATH="${PUB_CACHE}/bin:${PATH}"

DART_SDK_VERSION=$(dart --version 2>&1 || true)
echo "Using ${DART_SDK_VERSION}"

dart pub get
dart pub global activate jaspr_cli
jaspr build
