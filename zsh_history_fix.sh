#!/usr/bin/env zsh

# Fixes a corrupt .zsh_history file

ZSH_HISTORY_PATH=~/.config/zsh

mv ${ZSH_HISTORY_PATH}/zsh_history ${ZSH_HISTORY_PATH}/zsh_history_bad
strings -eS ${ZSH_HISTORY_PATH}/zsh_history_bad > ${ZSH_HISTORY_PATH}/zsh_history
#fc -R ${ZSH_HISTORY_PATH}/zsh_history
rm ${ZSH_HISTORY_PATH}/zsh_history_bad