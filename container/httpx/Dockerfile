FROM golang:latest

RUN mkdir /data

RUN apt update &&\
    go get -u github.com/projectdiscovery/httpx/cmd/httpx 

COPY main.sh /main.sh
RUN chmod +x /main.sh

ENTRYPOINT [ "bash", "/main.sh" ]