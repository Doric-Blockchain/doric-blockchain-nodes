# ##AWS ECR TO MAC M1
FROM --platform=linux/amd64 node:alpine

# ## OTHER BUILD 
# FROM node:alpine

ADD . /eth-netstats
WORKDIR /eth-netstats

RUN npm install \
  && npm install -g grunt-cli \
  && grunt

EXPOSE 3000
CMD ["npm", "start"]