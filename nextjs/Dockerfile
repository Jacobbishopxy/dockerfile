# Author: Jacob Bishop

# base
FROM nodejs

# create work directory
WORKDIR /app

# copy package.json to workdir
ADD ./yarn.lock /app

# install packages
RUN yarn

# copy source code to workdir
ADD ./ /app

# execute npm start
CMD yarn build && yarn start

# expose server 3000 to host
EXPOSE 3000
