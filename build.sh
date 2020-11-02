#!/bin/bash

for i in $(ls -d */);
do 
container_name=$(echo $i | cut -d "/" -f1)
    cd $i 
    sudo docker build . -t $container_name
    cd ..
done
