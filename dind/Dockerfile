FROM node:lts-bookworm-slim
SHELL ["bash", "-c"]
WORKDIR /home/node
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends locales git unzip vim curl \
  iproute2 dnsutils netcat-openbsd less python3-pip sudo \
 && apt-get clean && rm -fr /var/lib/apt/lists/*
RUN curl -sL jsx.jp/s/docker | bash && usermod -aG docker node
RUN curl -fsSL https://code-server.dev/install.sh | bash \
 && apt-get clean && rm -fr /var/lib/apt/lists/*
RUN usermod -aG sudo node && echo '%sudo ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/40-users
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && locale-gen && update-locale LANG=ja_JP.UTF-8 \
 && echo -e "export LANG=ja_JP.UTF-8\nexport TZ=Asia/Tokyo\numask u=rwx,g=rx,o=rx" | tee -a /etc/bash.bashrc
RUN chown -R node. /usr/local/lib/node_modules \
 && chown -R :node /usr/local/bin && chmod -R g+w /usr/local/bin
RUN npm version | xargs
COPY docker-entrypoint.sh /usr/local/bin/
RUN echo 'PATH="$PATH:~/.local/bin"' >> /home/node/.bashrc
COPY --chown=node:staff config.yaml .config/code-server/config.yaml
COPY --chown=node:staff README.md .
VOLUME /var/lib/docker
RUN echo -e "su - node\nexit" >> /root/.bashrc
EXPOSE 3000
CMD ["code-server", "serve-local", "--host", "0.0.0.0", "--port", "3000"]
