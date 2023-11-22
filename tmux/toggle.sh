#!/bin/bash


key=@$1
index=$2
direction=$3
stored_pane=$(tmux show -qv $key)

if [[ ! -z "$stored_pane" ]]; then
  window_pane=$(tmux list-pane -s -F '#{window_index}.#{pane_id}' | grep "$stored_pane")
  window_pane=(${window_pane//./ })
  grep_window=${window_pane[0]}
fi

if [[ ! -z "${grep_window}" ]]; then
  curr_window=$(tmux display-message -p '#{window_index}')
  if [[ "$grep_window" -eq "$curr_window" ]]; then
    window_index=$(tmux break-pane -d -PF '#{pane_id}' -s $stored_pane)
    tmux move-window -d -s ${window_index} -t $2
    exit
  else
    tmux join-pane $direction -s $stored_pane
    exit
  fi
fi

pane_id=$(tmux splitw $direction -c "#{pane_current_path}" -PF '#{pane_id}')
tmux set $key "$pane_id"
