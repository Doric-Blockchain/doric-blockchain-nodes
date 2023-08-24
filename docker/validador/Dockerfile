## AWS ECR TO MAC M1
## FROM ubuntu:latest -platform=linux/amd64 ubuntu:latest 

## OTHER BUILD 
FROM ubuntu:latest

WORKDIR /

COPY . ./

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:longsleep/golang-backports -y 
RUN apt-get update -y && apt-get upgrade -y && apt-get install build-essential bison wget curl golang-go make git -y