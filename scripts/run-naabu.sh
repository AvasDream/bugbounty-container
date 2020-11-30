#!/bin/bash
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
mkdir portscan
touch naabu-$domain.canary
if [[ -f naabu-$domain.canary ]]
then
        echo "Naabu was executed. Skipping $domain"
        sleep 1
else
        echo $domain
        sudo docker run -it --rm projectdiscovery/naabu -host $domain -p- -silent -nC > /portscan/ports-$domain.txt
        notify "Port scan: $domain - $(cat "/portscan/ports-$domain.txt")"
fi
cd ..
done