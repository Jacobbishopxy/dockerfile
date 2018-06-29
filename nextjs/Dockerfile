# Author: Jacob Bishop

# base
FROM node

# mkdir
RUN mkdir /app

# copy source code to workdir
COPY ./ /app

# create work directory
WORKDIR /app

# expose server 3000 to host
EXPOSE 3000

# install packages
RUN yarn install && yarn build
