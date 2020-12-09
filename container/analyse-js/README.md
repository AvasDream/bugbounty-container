## Usage

`docker run -it --rm -v "$(pwd):/data" analyse-js`

## ToDo

- Replace getJS with Gospider 
- Bug:
    - Executions stops at some domains:
        - https://cnbj6.cloud.mi.com
        - https://benteng.e.mi.com 
```
# Install Gospider
RUN go get -u github.com/jaeles-project/gospider

function execute-gospider {
    #gospider -S "$data_dir/$URL_LIST" --depth 2 --threads 128 --concurrent 32 --output "$data_dir/gospider" --timeout 4 --other-source
    gospider --user-agent web --threads 32 --concurrent 32 --depth 2 --other-source --site $URL | tee gospider.txt
}
```
## Steps

- getJS
- photo crawler
- sort and uniq urls 
- linkfinder
- secretfinder