#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No URL supplied"
    echo "Usage: docker run -it --rm -v '\$(pwd):/data' analyse-js \$domain"
    exit 0
fi
URL=$1
domain=$(echo $URL | cut -d "/" -f3)
function execute-photon {
    python3 Photon/photon.py --url $domain --output data/$domain --level 6 -t 32 --wayback 
}

function execute-gospider {
    #gospider -S "$data_dir/$URL_LIST" --depth 2 --threads 128 --concurrent 32 --output "$data_dir/gospider" --timeout 4 --other-source
    mkdir totallyuniq
    echo "Crawling $URL"
    gospider --user-agent web --threads 32 --concurrent 32 --depth 1 --other-source --site $URL -o /totallyuniq > /dev/null
}

function clean-data {
    echo "$domain"
    cat /totallyuniq/* | wc -l
    cat /totallyuniq/* | grep "\[javascript\]" > /data/$domain-javascript.txt
    cat /totallyuniq/* | grep "\[url\]" > /data/$domain-url.txt
    cat /totallyuniq/* | grep "\[form\]" > /data/$domain-form.txt
    cat /totallyuniq/* | grep "\[linkfinder\]" > /data/$domain-linkfinder.txt
}

function main {
    execute-gospider
    clean-data
}

main