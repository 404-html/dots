#!/bin/bash

sink=$(pactl info | grep 'Default Sink' | awk '{ print $3; }')
pactl "$1" "$sink" "${@:2}"
