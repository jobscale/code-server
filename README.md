# run with container

debian bookworm based.

## docker build and run

```bash
git clone https://github.com/jobscale/code-server.git
cd code-server

docker build . -f dind/Dockerfile -t local/code-server:dind
docker run --name code-server --privileged -it local/code-server:dind bash

docker start code-server
docker exec -it code-server bash
```

## Docker in Docker

### run dind

```
docker run --privileged --restart always --name dind -it ghcr.io/jobscale/code-server:dind bash
```

### test dind

```
./daemon-test
```

## More installation

### npm

```
npm i -g npm@latest
```

### serverless

```
npm i -g serverless
serverless --version
```

### sam

```
pip install aws-sam-cli
sam --version
```

### amplify

```
npm i -g @aws-amplify/cli
amplify --version
```

### vue v3

```
npm i -g @vue/cli
vue --version
```

### jp - JMESPath

```
npm i -g @jobscale/jp
jp --version
```
