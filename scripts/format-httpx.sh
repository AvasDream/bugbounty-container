#!/bin/bash
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
sudo chown -R ubuntu $i
if [[ -f httpx-$domain.canary ]]
then
        cat httpx-$domain.txt | cut -d " " -f 1 | cut -d":" -f1,2 > online-subdomains.txt
fi
cd ..
done