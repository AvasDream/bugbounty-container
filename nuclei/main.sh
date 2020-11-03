#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 0
fi
toolsDir='/tools'
DOMAIN="$1"
inputfile="$2"
touch /data/nuclei-$DOMAIN.canary
function nuclei-exec {
    nuclei -nC -l "$inputfile" -t "$toolsDir"'/nuclei/nuclei-templates/' -timeout 3 -o "/data/nuclei-$DOMAIN.txt" 
}

function main {
    nuclei-exec
}

main

