FROM golang:latest

RUN mkdir /data

RUN apt update &&\
    go get -u github.com/hahwul/dalfox

COPY main.sh /main.sh
RUN chmod +x /main.sh

ENTRYPOINT [ "bash", "/main.sh" ]

