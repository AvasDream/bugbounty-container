#!/bin/bash
set -e
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
mkdir portscan
current_dir=$(pwd)
if [[ -f naabu-$domain.canary ]]
then
        echo "Naabu was executed. Skipping $domain"
        sleep 1
else
        for target in $(cat online-naabu.txt);
        do
                echo $target
                sudo docker run -it --rm projectdiscovery/naabu -host $target -p - -silent -nC > "$current_dir/portscan/ports-$target.txt"
                notify "Port scan: $target - $(cat "$current_dir/portscan/ports-$target.txt")"
        done
fi
touch naabu-$domain.canary
cd ..
done