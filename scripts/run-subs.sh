#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Usage: ./run-subs \$file"
    exit 0
fi
targets="$1"
for domain in $(cat $targets);
do 
    sudo docker run -it -v "$(pwd):/data" --rm subs $domain
    cd $domain
    notify "$domain - $(cat count.txt)"
done