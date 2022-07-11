FROM node:lts-bullseye
SHELL ["bash", "-c"]
WORKDIR /home/node
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y locales git zip unzip vim curl iproute2 dnsutils netcat less python3-pip sudo
RUN rm -fr /var/lib/apt/lists/*
RUN usermod -aG sudo node && echo '%sudo ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/40-users
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && locale-gen && update-locale LANG=ja_JP.UTF-8 \
 && echo -e "export LANG=ja_JP.UTF-8\nexport TZ=Asia/Tokyo\numask u=rwx,g=rx,o=rx" | tee -a /etc/bash.bashrc
RUN npm i -g npm
RUN npm version
RUN chown -R node. /usr/local/lib/node_modules && chown -R :node /usr/local/bin && chmod -R g+w /usr/local/bin
USER 1000
RUN echo "PATH=\"\$PATH:~/.local/bin\"" >> /home/node/.bashrc
COPY . .
EXPOSE 3000
