#!/bin/bash

backlight="$(ls /sys/class/backlight/ | head -n1)"

if [ "$1" = "+" ]; then
    
    
