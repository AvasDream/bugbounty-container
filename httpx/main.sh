#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 0
fi
DOMAIN="$1"
INPUT="$2"
touch /data/httpx-$DOMAIN.canary
httpx -silent -no-color -l "$INPUT" -title -content-length -web-server -status-code -ports 80,443 -threads 25 -o "/data/httpx-$DOMAIN.txt"




