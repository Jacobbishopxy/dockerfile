# Author: Jacob Bishop

# base
FROM xy/nodejs

# create work directory
WORKDIR /app

# copy package.json to workdir
ADD ./package.json /app

# install packages
RUN npm install

# copy source code to workdir
ADD ./ /app

# build
RUN npm run build

CMD ["node", "dist/"]

# expose server 3000 to host
EXPOSE 3000
