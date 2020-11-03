#!/bin/bash
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
if [[ -f nuclei-$domain.canary ]]
then
        echo "Nuclei was executed. Skipping $domain"
        sleep 1
else
        echo $domain
        sudo docker run -it --rm -v "$(pwd):/data" nuclei $domain /data/online-subdomains.txt
        notify "Nuclei for $domain - \n $(cat "nuclei-$domain.txt" | cut -d" " -f1 | sort -u )"
fi
cd ..
done