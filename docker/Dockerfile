FROM ubuntu:latest

ENV TZ=Europe/Paris

RUN DEBIAN_FRONTEND="noninteractive" apt update && apt install -y openssh-server \
		sudo \
		git \
		openssl \
		curl \
		&& curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash - \
		&& echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
		&& apt-get install -y -q nodejs \
		npm

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 blop 

RUN  echo 'blop:blop' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
