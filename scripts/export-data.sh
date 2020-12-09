#!/bin/bash

foler_name=$(pwd | rev | cut -d "/" -f1 | rev)
cd ..
tar -zcvf $folder_name.tar.gz $folder_name
cp $folder_name.tar.gz $folder_name/
cd $folder_name
sudo python3 -m http.server 80