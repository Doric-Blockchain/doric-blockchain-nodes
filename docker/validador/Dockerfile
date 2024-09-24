## AWS ECR TO MAC M1
## FROM ubuntu:latest -platform=linux/amd64 ubuntu:latest 

## OTHER BUILD 
FROM ubuntu:latest

WORKDIR /

COPY . ./

RUN apt-get update && \
    apt-get install -y software-properties-common snapd && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get install -y snapd
RUN apt-get update -y && apt-get upgrade -y && apt-get install build-essential bison wget curl make git -y