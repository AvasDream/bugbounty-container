FROM kalilinux/kali-rolling:latest
RUN apt update
# Install essentials
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget curl git
# Install go 
RUN apt install -y golang
RUN go version
RUN export PATH=$PATH:$(go env GOPATH)/bin
# Install Python
RUN curl -O https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tar.xz
RUN tar -xf Python-3.8.0.tar.xz  
RUN cd Python-3.8.0 &&\
    ./configure --enable-optimizations &&\
    make &&\
    make altinstall
RUN apt install python3-pip -y

# Install getJS
RUN go get -u github.com/003random/getJS

# Install Linkfinder
RUN git clone https://github.com/GerbenJavado/LinkFinder.git &&\
    cd LinkFinder &&\
    python3 setup.py install

#Install Secretsfinder
RUN git clone https://github.com/m4ll0k/SecretFinder.git secretfinder &&\
    cd secretfinder &&\
    pip3 install -r requirements.txt


# Setup Bash script
COPY main.sh /root/main.sh
RUN chmod +x /root/main.sh
# Create output folder inside the container
RUN mkdir /data
# Modify Path to include go binaries
ENV PATH="/root/go/bin:${PATH}"
ENTRYPOINT [ "/root/main.sh" ]
