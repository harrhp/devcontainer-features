curl -sfL https://github.com/devcontainers-contrib/nanolayer/releases/latest/download/nanolayer-x86_64-unknown-linux-gnu.tgz \
  | tar fxvz - -C /tmp \
  && chmod 755 /tmp/nanolayer \
  && /tmp/nanolayer \
  install \
  gh-release \
  --version "$VERSION" \
  JanDeDobbeleer/oh-my-posh \
  oh-my-posh \
  && rm /tmp/nanolayer
