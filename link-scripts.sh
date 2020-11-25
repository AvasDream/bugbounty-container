#!/bin/bash

for i in $(ls scripts/);
do 
    if [ -f /usr/local/bin/$i ]
    then
        sudo rm -rf /usr/local/bin/$i
    fi
    sudo chmod +x "scripts/$i" 
    sudo ln -s "$(pwd)/scripts/$i" /usr/local/bin/
done