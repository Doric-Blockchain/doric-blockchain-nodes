## AWS ECR TO MAC M1
## FROM ubuntu:latest -platform=linux/amd64 ubuntu:latest 

## OTHER BUILD 
FROM ubuntu:latest

WORKDIR /

COPY . ./

RUN apt-get update
RUN apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update -y && apt-get upgrade -y && apt-get install build-essential bison wget curl make git -y