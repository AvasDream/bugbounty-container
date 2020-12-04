FROM kalilinux/kali-rolling:latest
RUN apt update
# Install essentials
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget curl git
# Install go 
RUN apt install -y golang
RUN go version
ENV PATH="/root/go/bin:${PATH}"
# Install Python
RUN curl -O https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tar.xz
RUN tar -xf Python-3.8.0.tar.xz  
RUN cd Python-3.8.0 &&\
    ./configure --enable-optimizations &&\
    make &&\
    make altinstall
RUN apt install python3-pip -y

# Install Photon
RUN git clone https://github.com/s0md3v/Photon.git &&\
    cd Photon &&\
    pip3 install -r requirements.txt

# Install Gospider
RUN go get -u github.com/jaeles-project/gospider

# Setup Bash script
COPY main.sh /root/main.sh
RUN chmod +x /root/main.sh
# Create output folder inside the container
RUN mkdir /data
# Modify Path to include go binaries
ENV PATH="/root/go/bin:${PATH}"
ENTRYPOINT [ "/root/main.sh" ]
