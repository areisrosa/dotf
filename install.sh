#!/usr/bin/env bash

set -e

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$HOME/.dotf" ]; then
    echo "Installing Dotfiles for the first time"
    git clone --depth=1 https://github.com/areisrosa/dotf.git "$HOME/.dotf"
    cd "$HOME/.dotf"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
    echo "Dotf successfully installed"
else
    cd "${BASEDIR}"
    git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
    git submodule update --init --recursive "${DOTBOT_DIR}"
    "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
    echo "Links created and dotf is already installed"
fi

