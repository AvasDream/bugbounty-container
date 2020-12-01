#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 0
fi
DOMAIN="$1"
INPUT="$2"
touch /data/xss-$DOMAIN.canary
dalfox file "$INPUT" --follow-redirects --no-color --no-spinner --skip-bav  -o "/data/xss-$DOMAIN.txt"


