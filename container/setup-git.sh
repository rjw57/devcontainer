#!/bin/bash
set -ex -o pipefail

# Always try to push to GitHub via SSH, not HTTP. (Useful for pushing changes to bash/neovim/etc
# config).
git config --global url."git@github.com:".pushInsteadOf "https://github.com/"

# The modern default.
git config --global init.defaultBranch main

# I would rather know than have magic happen.
git config --global pull.ff only
