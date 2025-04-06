#!/usr/bin/env bash

set -o xtrace

curl -sfL https://github.com/devcontainers-extra/nanolayer/releases/download/v0.5.6/nanolayer-x86_64-unknown-linux-gnu.tgz \
  | tar fxvz - -C /tmp \
  && chmod 755 /tmp/nanolayer

readarray -d " " -t ADDITIONAL_BINARIES <<< "$ADDITIONALBINARIES"

BASE_BINARIES=( "dhall:dhall" "dhall-lsp-server" )
EFFECTIVE_BINARIES=("${BASE_BINARIES[@]}" "${ADDITIONAL_BINARIES[@]}")

for BINARIES in "${EFFECTIVE_BINARIES[@]}"; do
  readarray -d ":" -t ARGS <<< "$BINARIES"

  case "${#ARGS[@]}" in

    3)
      LIB=${ARGS[0]}
      ASSET=${ARGS[1]}
      BINARY_NAMES=${ARGS[2]}
      ;;
    2)
      unset LIB
      ASSET=${ARGS[0]}
      BINARY_NAMES=${ARGS[1]}
      ;;
    1)
      unset LIB
      unset ASSET
      BINARY_NAMES=${ARGS[0]}
      ;;
  esac

  LIB_ARG=${LIB:+"--lib-name $LIB"}
  ASSET_REGEX_ARG=${ASSET:+"--asset-regex ^$ASSET-\d"}

  /tmp/nanolayer install gh-release $LIB_ARG $ASSET_REGEX_ARG --version "$VERSION" dhall-lang/dhall-haskell $BINARY_NAMES
done

rm /tmp/nanolayer
