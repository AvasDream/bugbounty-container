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
    # -bulk-size 25 -c 32  <- Doesnt make it faster. 
    nuclei -no-color -exclude "$toolsDir"'/nuclei/nuclei-templates/fuzzing/basic-auth-bruteforce.yaml' -l "$inputfile" -t "$toolsDir"'/nuclei/nuclei-templates/' -timeout 3 -o "/data/nuclei-$DOMAIN.txt" 
}

function main {
    nuclei-exec
}

main

