FROM golang:alpine AS build

RUN apk add --no-cache git

RUN go get -u github.com/tomnomnom/gf
RUN mkdir /root/.gf
RUN git clone https://github.com/1ndianl33t/Gf-Patterns
RUN mv Gf-Patterns/*.json ~/.gf
RUN cp /go/bin/* /usr/bin/

RUN mkdir /data

ENTRYPOINT ["gf"] 