#!/usr/bin/env bash
set -e

TMUX_SESSION=fan_control
FAN_CONTROL_SCRIPT=hybrid_fan_controller.pl

tmux kill-session -t "$TMUX_SESSION" || :
tmux new-session -d -s "$TMUX_SESSION" "$FAN_CONTROL_SCRIPT"
