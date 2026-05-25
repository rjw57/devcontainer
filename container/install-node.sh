#!/bin/bash
set -e -o pipefail

[ -z "${NPM_RELEASE}" ] && (echo "NPM_RELEASE not set" >&2; exit 1)
[ -z "${YARN_RELEASE}" ] && (echo "YARN_RELEASE not set" >&2; exit 1)
[ -z "${PNPM_RELEASE}" ] && (echo "PNPM_RELEASE not set" >&2; exit 1)

# Install latest node LTS
nvm install --lts
nvm use --lts

# Install package managers
nvm exec default corepack enable
nvm exec default corepack prepare npm@${NPM_RELEASE} --activate
nvm exec default corepack prepare yarn@${YARN_RELEASE} --activate
nvm exec default corepack prepare pnpm@${PNPM_RELEASE} --activate

# Configure package managers securely with a three-day cooldown for install.
cat <<EOI >>~/.npmrc
ignore-scripts=true
min-release-age=3
EOI

cat <<EOI >>~/.yarnrc.yml
enableScripts: false
npmMinimalAgeGate: 3d
EOI

[ ! -d "$HOME/.config/pnpm" ] && mkdir -p ~/.config/pnpm
cat <<EOI >>~/.config/pnpm/config.yaml
ignoreScripts: true
minimumReleaseAge: 4320
EOI
