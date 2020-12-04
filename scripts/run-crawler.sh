#!/bin/bash

for i in $(ls -d */);
do
        domain=$(echo $i | cut -d "/" -f1)
        cd $i
        if [[ -d crawler ]]
        then
                echo "Crawler was executed. Skipping $domain"
                sleep 1
        else
                current_dir=$(pwd)
                mkdir crawler
                for target in $(cat online-subdomains.txt | grep https);
                do
                        echo "Host: $target"
                        domain=$(echo $target | cut -d "/" -f3)
                        cd crawler
                        sudo docker run -it --rm -v "$(pwd):/data" crawler $target
                        notify "Crawler $target - URLs: $(cat $domain-urls.txt | wc -l) - JavaScript: $(cat $domain-javascript.txt | wc -l)- Forms: $(cat $domain-form.txt | wc -l) - Links: $(cat $domain-linkfinder.txt | wc -l)"    
                        cd ..
                done
        fi
        cd ..
done