
```
cat domains.txt | grep 443 | cut -d "/"  -f3 | cut -d ":" -f1 > params-domains.txt
```


```
docker run -it --rm -v "$(pwd):/data" params redguard.ch

for i in $(cat params-domains.txt);do docker run -it --rm -v "$(pwd):/data" params $i;done
```