#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "dhall installed" dhall --version
check "dhall-lsp-server installed" dhall-lsp-server --version

check "dhall-to-yaml-ng installed" dhall-to-yaml-ng --version
check "yaml-to-dhall installed" yaml-to-dhall --version

check "dhall-to-json installed" dhall-to-json --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
