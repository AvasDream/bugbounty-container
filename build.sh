#!/bin/bash

sudo docker pull projectdiscovery/naabu

for i in $(ls -d */);
do 
    if [[ $i == "script" ]]; then
        continue
    fi
    container_name=$(echo $i | cut -d "/" -f1)
    cd $i 
    sudo docker build . -t $container_name
    cd ..
done
