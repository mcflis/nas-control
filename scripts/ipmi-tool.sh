#!/usr/bin/env sh

ipmitool -I lanplus -H 192.168.178.5 -U ADMIN -P "$(cat ~/.credentials/ipmi)" "$@"
