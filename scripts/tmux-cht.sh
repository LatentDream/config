#!/usr/bin/env bash
languages=$(echo "python c typescript shell golang rust lua" | tr " " "\n")
core_utils=$(echo "rg fd sed awk jq" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Enter a selection: " query 

if echo "$languages" | grep -qs "$selected"; then
    tmux split-window bash -c "curl 'cht.sh/$selected/$(echo "$query")' | less -R"
elif echo "$core_utils" | grep -q "$selected"; then
  tmux split-window bash -c "curl cht.sh/$selected~$query  | less -R"
else
  echo "Invalid selection"
fi
