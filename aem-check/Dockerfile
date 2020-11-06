FROM python:latest

RUN apt update &&\
    apt install python3-pip -y &&\
    git clone https://github.com/0ang3el/aem-hacker.git &&\
    cd aem-hacker &&\
    pip3 install -r requirements.txt

ENTRYPOINT [ "python" , "/aem-hacker/aem_hacker.py" ]