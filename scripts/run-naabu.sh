#!/bin/bash
set -e
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
current_dir=$(pwd)
if [[ -d portscan ]]
then
        echo "Naabu was executed. Skipping $domain"
        sleep 1
else

        mkdir portscan
        for target in $(cat online-naabu.txt);
        do
                echo $target
                sudo docker run -it --rm projectdiscovery/naabu -host $target -p - -silent -nC > "$current_dir/portscan/ports-$target.txt"
                notify "Port scan: $target - $(cat "$current_dir/portscan/ports-$target.txt")"
        done
fi
cd ..
done