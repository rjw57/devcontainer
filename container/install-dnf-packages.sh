#!/bin/bash
set -e -o pipefail
dnf --assumeyes install --nogpgcheck \
  --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf --assumeyes upgrade
dnf --assumeyes install --setopt=install_weak_deps=False \
  @development-tools git \
  which curl wget httpie \
  neovim lua fzf ripgrep luarocks golang-github-jesseduffield-lazygit fd-find \
  nvm nvm-bash-completion \
  uv python3 python3-pip \
  rustup \
  golang
dnf clean all
