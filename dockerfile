# docker build -t ctf:ubuntu19.10 .
# docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# docker exec -it ctf /bin/bash
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
apt-get update && \
#apt-get install -y \
#build-essential \
#jq \
#strace \
#ltrace \
#tmux \
#curl \
#wget \
#git \
#make \
#netcat \
#net-tools \
#gcc \
#gcc-multilib \
#neovim \
#rubygems \
#gdb \
#gdb-multiarch \
#python3 \
#python3-pip \
#python3-dev \
#libssl-dev \
#libffi-dev \
#procps \
#libpcre3-dev \
#libdb-dev \
#libxt-dev \
#libxaw7-dev \
#libc6:i386 \
#libncurses5:i386 \
#libstdc++6:i386 && \
apt-get install -y build-essential jq strace ltrace tmux curl wget git make netcat net-tools gcc gcc-multilib neovim rubygems gdb gdb-multiarch python3 python3-pip python3-dev libssl-dev libffi-dev procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev libc6:i386 libncurses5:i386 libstdc++6:i386 && \
pip3 install requests pwntools r2pipe && \
mkdir tools && cd tools && \
# Radare, Ropgadget and libc-database 
git clone https://github.com/JonathanSalwan/ROPgadget && \
git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && \
#cd .. && git clone https://github.com/niklasb/libc-database && cd libc-database && ./get && \
# GEF plugin for GDB
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py && \
echo source ~/.gdbinit-gef.py >> ~/.gdbinit 
