#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Usage: delete-in-all.sh \$file"
    exit 0
fi
file_to_delete=$1
for i in $(ls -d */);
do 
cd $i
rm -rf $file_to_delete 
cd ..
done