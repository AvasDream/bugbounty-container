#!/bin/bash

for i in $(ls -d */);
do
        domain=$(echo $i | cut -d "/" -f1)
        cd $i
        if [[ -d js-analysis ]]
        then
                echo "JS analysis was executed. Skipping $domain"
                sleep 1
        else
                current_dir=$(pwd)
                mkdir js-analysis
                for target in $(cat online-subdomains.txt | grep https);
                do
                        echo "Host: $target"
                        domain=$(echo $target | cut -d "/" -f3)
                        sudo docker run -it --rm -v "$(pwd)/js-analysis:/data" analyse-js $target
                        msg=$(cat "$current_dir/js-analysis/js-analysis-$domain.txt")
                        msg_size=$(echo "$msg" | wc -c)
                        if (( msg_size < 4095 )); then
                                notify "JS analysis for: $target - Message too big"
                        else
                                notify "JS analysis for: $target - $msg"
                        fi
                done
        fi
        cd ..
done