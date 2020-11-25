for i in $(ls -d */);
do
domain=$(echo $i | cut -d "/" -f1)
cd $i
#cat httpx-*.txt | cut -d " " -f1 > domains.txt
# nuclei-acronis.com.txt
if [[ -f nuclei-$domain.txt ]]
then
        cat nuclei-$domain.txt | grep "$1"
fi
cd ..
done