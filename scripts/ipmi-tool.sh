#!/usr/bin/env sh

ipmitool -I lanplus -H 10.7.1.11 -U ADMIN -P "$(cat ~/.credentials/ipmi)" "$@"
