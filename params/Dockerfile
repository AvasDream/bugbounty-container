FROM python:latest

RUN apt update &&\
    apt install python3-pip -y &&\
    git clone https://github.com/devanshbatham/ParamSpider &&\
    cd ParamSpider &&\
    pip3 install -r requirements.txt

COPY main.sh /main.sh
RUN chmod +x /main.sh 
RUN mkdir /data

ENTRYPOINT [ "bash" , "main.sh" ]