#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 0
fi
DOMAIN=$1
touch /data/params-$DOMAIN.canary
python /ParamSpider/paramspider.py --level high --subs False -o /data/params-$DOMAIN.txt -d $DOMAIN