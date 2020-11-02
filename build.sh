#!/bin/bash

for i in $(ls -d */);
do 
container_name=$(echo $i | cut -d "/" -f1)
    cd $i 
    docker build . -t $container_name
    cd ..
done
