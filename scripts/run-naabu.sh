#!/bin/bash

for i in $(ls -d */);
do
        domain=$(echo $i | cut -d "/" -f1)
        cd $i
        if [[ -d portscan ]]
        then
                echo "Naabu was executed. Skipping $domain"
                sleep 1
        else
                echo "Execute for parent domain $i"
                current_dir=$(pwd)
                mkdir portscan
                for target in $(cat online-naabu.txt);
                do
                        echo "Host: $target"
                        sudo docker run -it --rm projectdiscovery/naabu -host $target -p - -silent -nC > "$current_dir/portscan/ports-$target.txt"
                        notify "Port scan: $target - $(cat "$current_dir/portscan/ports-$target.txt")"
                done
        fi
        cd ..
done