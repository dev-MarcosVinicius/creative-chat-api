FROM node:14.16.1

USER root

ENV DOCKERIZE_VERSION v0.6.1

RUN apt-get update -y && apt-get -y install wget && apt-get install build-essential -y

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /usr/creative-chat-api/app/

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000