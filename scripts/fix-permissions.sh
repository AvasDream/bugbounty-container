#!/bin/bash
for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
chown -R ubuntu $i
done