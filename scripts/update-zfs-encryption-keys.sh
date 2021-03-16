#!/usr/bin/env sh

for ds in $(zfs list -rHo name tank1/enc1 | tail -n +2); do zfs change-key -li "$ds"; done
