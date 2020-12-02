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
    getJS --insecure --nocolors --url $URL --output js/js-urls-all.txt >> /dev/null
}

function format-urls {
    for url in $(cat js/js-urls-all.txt)
    do 
        if  [[ $url == //* ]];
        then
            if  [[ $URL == https://* ]];
            then
                true
                echo https:$url >> js/js-urls.txt
            else
                false
                echo http:$url >> js/js-urls.txt
            fi
        elif [[ $url == /* ]];
        then
            echo $URL$url >> js/js-urls.txt
        else 
            echo $url >> js/js-urls.txt
        fi
    done
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
        python3 secretfinder/SecretFinder.py -i $url -o cli -g 'twitter;facebook;google;jquery;bootstrap;api.google.com;cdn.'  >> js/secretfinder-results.txt
    done
    
}

function format-output {
    echo -e "\nJavaScript Files analysed:"
    cat js/js-urls.txt
    echo "Secrets:"
    cat js/secretfinder-results.txt
    echo -e "\nLinks:"
    cat js/linkfinder-results.txt
    echo -e "\nJavaScript Files output:"
    cat js/js-urls-all.txt
}

function main {
    execute-getjs
    # If URLs are in getjs do:
    if [[ -s "js/js-urls-all.txt" ]]
    then    
        format-urls 
        execute-linkfinder
        execute-secretfinder
        format-output >> data/js-analysis-$domain.txt
    else 
        echo "No JS Files found" >> data/js-analysis-$domain.txt
    fi
}

main