#!/bin/bash
set -ex -o pipefail

# Install bash configuration.
git clone --depth=1 https://github.com/rjw57/bash-config/ ~/.bash.d
cat >>~/.bashrc <<EOF
if [ -d ~/.bash.d ]; then
  for i in ~/.bash.d/*.sh; do
    if [ -r \$i ]; then
      . \$i
    fi
  done
  unset i
fi
EOF
