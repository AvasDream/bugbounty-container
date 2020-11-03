#!/bin/bash

for i in $(ls scripts/);
do 
    chmod +x "scripts/$i" 
    ln -s "$(pwd)/scripts/$i" /usr/local/bin/
done