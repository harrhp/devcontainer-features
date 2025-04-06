curl -sfL https://github.com/devcontainers-extra/nanolayer/releases/download/v0.5.6/nanolayer-x86_64-unknown-linux-gnu.tgz \
  | tar fxvz - -C /tmp \
  && chmod 755 /tmp/nanolayer \
  && /tmp/nanolayer \
  install \
  gh-release \
  --version "$VERSION" \
  JanDeDobbeleer/oh-my-posh \
  oh-my-posh \
  && rm /tmp/nanolayer
