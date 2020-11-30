#!/bin/bash
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
if [[ -f online-subdomains.txt ]]
then
        cat online-subdomains.txt | cut -d "/" -f3 | tr '[:upper:]' '[:lower:]' | sort -u > online-naabu.txt
else
        echo "No online-subdomains.txt file run format-httpx.sh for $domain"
        sleep 1
fi
cd ..
done