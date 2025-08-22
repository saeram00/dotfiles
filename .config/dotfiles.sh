#!/usr/bin/env bash

HOME_DIR="${XDG_HOME_DIR:-${HOME:-~}}"
CONFIG_DIR="${HOME_DIR}/.config"
VIM_DIR="${HOME_DIR}/.vim"

function main() {
	git --git-dir="${HOME_DIR}/.dotfiles" --work-tree="${HOME_DIR}" checkout
	ln -sv "${CONFIG_DIR}/shell/aliases" "${HOME_DIR}/.aliases"
	ln -sv "${CONFIG_DIR}/shell/profile" "${HOME_DIR}/.profile"
	ln -sv "${CONFIG_DIR}/shell/bash/bash_prompt" "${HOME_DIR}/.bash_prompt"
	ln -sv "${CONFIG_DIR}/shell/bash/bash_logout" "${HOME_DIR}/.bash_logout"
	ln -sv "${CONFIG_DIR}/shell/bash/bashrc" "${HOME_DIR}/.bashrc"
	ln -sv "${CONFIG_DIR}/shell/bash/inputrc" "${HOME_DIR}/.inputrc"
	ln -sv "${CONFIG_DIR}/shell/zsh/zshrc" "${HOME_DIR}/.zshrc"
	ln -sv "${CONFIG_DIR}/shell/zsh/zprofile" "${HOME_DIR}/.zprofile"
	ln -sv "${VIM_DIR}/vimrc" "${HOME_DIR}/.vimrc"
	ln -sv "${CONFIG_DIR}/tmux/tmux.conf" "${HOME_DIR}/.tmux.conf"
	ln -sv "${CONFIG_DIR}/tmux/tmuxline.vim" "${HOME_DIR}/.tmuxline"
}

main; exit
