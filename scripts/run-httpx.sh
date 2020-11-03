#!/bin/bash
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
if [[ -f httpx-$domain.canary ]]
then
        echo "HTTPX was executed. Skipping $domain"
        sleep 1
else
        echo $domain
        sudo docker run -it --rm -v "$(pwd):/data" httpx $domain "/data/subdomains.txt"
        notify "$domain - $(cat httpx-$domain.txt | wc -l) subdomains online"
fi
cd ..
done