FROM node:20
WORKDIR /opt/server
EXPOSE 8080
COPY package.json .
COPY *.js .
RUN npm install
CMD ["node", "server.js"]
