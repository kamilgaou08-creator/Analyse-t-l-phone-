#!/bin/sh
# Bootstrap helper. The official Gradle wrapper JAR is intentionally not embedded
# in this archive; use the GitHub Actions workflow or install Gradle 8.9 locally.
set -eu
if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi
echo "Gradle 8.9 is required. Install Gradle or run the GitHub Actions workflow." >&2
exit 1
