FROM golang:latest

RUN mkdir /tools
RUN mkdir /code
RUN mkdir /data
ENV toolsdir="/tools"

RUN apt update &&\
    apt install git &&\
    apt install python3 python3-pip -y 


RUN cd ${toolsdir} || { echo "Something went wrong"; exit 1; } &&\
    git clone -q https://github.com/projectdiscovery/nuclei.git &&\
    cd nuclei/v2/cmd/nuclei/ || { echo "Something went wrong"; exit 1; } &&\
    go build &&\
    mv nuclei /usr/local/bin/

RUN cd ${toolsdir}'/nuclei' || { echo "Something went wrong"; exit 1; } &&\
    git clone -q https://github.com/projectdiscovery/nuclei-templates.git


COPY main.sh /code/main.sh
RUN chmod +x /code/main.sh

ENTRYPOINT [ "/code/main.sh" ]