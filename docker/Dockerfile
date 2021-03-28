FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt update && apt install -y openssh-server \
		sudo \
		git \
		iproute2 \
		nodejs \
		npm \
		iputils-ping \
		language-pack-fr \
		&& apt-get clean \
		&& apt-get autoclean

RUN node -v
RUN npm -v

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 blop 

RUN  echo 'blop:blop' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
