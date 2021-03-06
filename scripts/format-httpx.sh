#!/bin/bash
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
if [[ -f httpx-$domain.canary ]]
then
        cat httpx-$domain.txt | cut -d " " -f 1 | cut -d":" -f1,2 | tr '[:upper:]' '[:lower:]' | sort -u > online-subdomains.txt
fi
cd ..
done