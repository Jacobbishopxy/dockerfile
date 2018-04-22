# Author: Jacob Bishop
FROM xy/nodejs
WORKDIR /app
ADD ./code/package.json /app
RUN npm i
ADD ./code /app
CMD yarn start
EXPOSE 3000
