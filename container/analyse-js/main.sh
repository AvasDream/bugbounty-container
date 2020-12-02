#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No URL supplied"
    echo "Usage: docker run -it --rm -v '\$(pwd):/data' analyse-js \$url"
    exit 0
fi
URL=$1
domain=$(echo $URL | cut -d "/" -f3)
function execute-getjs {
    mkdir /js
    getJS --insecure --nocolors --url $URL --output js/js-urls-all.txt
    cat js/js-urls-all.txt | grep https > js/js-urls.txt
}

function execute-linkfinder {
    for url in $(cat js/js-urls.txt)
    do
        python3 LinkFinder/linkfinder.py -i $url -o cli >> js/linkfinder-results.txt
    done
}

function execute-secretfinder {
    # Custom exclusion of libraries
    for url in $(cat js/js-urls.txt)
    do
        python3 secretfinder/SecretFinder.py -i $url -o cli -g 'twitter;facebook;google;jquery;bootstrap;api.google.com'  >> js/secretfinder-results.txt
    done
    
}

function format-output {
    echo -e "\nJavaScript Files analysed:"
    cat js/js-urls.txt
    echo "Secrets:"
    cat js/secretfinder-results.txt
    echo -e "\nLinks:"
    cat js/linkfinder-results.txt
    echo -e "\nJavaScript Files:"
    cat js/js-urls-all.txt
}

function main {
    execute-getjs
    execute-linkfinder
    execute-secretfinder
    format-output >> data/js-analysis-$domain.txt
}

main