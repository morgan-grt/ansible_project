FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt update && apt install -y openssh-server \
		sudo \
		git \
		openssl \
		curl

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 15.9.0

RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install npm@latest -g

ENV NPM_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules/npm
ENV PATH      $NPM_PATH/bin:$PATH
RUN export PATH="$NPM_PATH:$PATH"

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 blop 

RUN  echo 'blop:blop' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
