## AWS ECR TO MAC M1
## FROM ubuntu:latest -platform=linux/amd64 ubuntu:latest 

## OTHER BUILD 
FROM ubuntu:latest

WORKDIR /

COPY . ./

RUN apt-get update && \
    apt-get install -y software-properties-common snapd && \
    rm -rf /var/lib/apt/lists/*
RUN snap install go --channel=1.16/stable --classic
RUN apt-get update -y && apt-get upgrade -y && apt-get install build-essential bison wget curl make git -y