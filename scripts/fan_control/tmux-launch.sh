#!/usr/bin/env bash
set -e

here=$(dirname "$0")
TMUX_SESSION=fan_control
FAN_CONTROL_SCRIPT=./hybrid_fan_controller.pl

tmux list-sessions || tmux new -d -s 'tmux-server'
tmux kill-session -t "$TMUX_SESSION" || :

pushd "$here"
tmux new-session -d -s "$TMUX_SESSION" "$FAN_CONTROL_SCRIPT"
popd
