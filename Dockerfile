# FROM node:20
# WORKDIR /opt/server
# EXPOSE 8080
# COPY package.json .
# COPY *.js .
# RUN npm install
# CMD ["node", "server.js"]

# Stage - 1
FROM node:20.19.5-alpine3.21 AS build

WORKDIR /opt/server

COPY package.json .

COPY *.js .

RUN npm install

# Stage - 2
FROM node:20.19.5-alpine3.21

WORKDIR /opt/server

RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && \
    chown -R roboshop:roboshop /opt/server

EXPOSE 8080

LABEL   com.project="roboshop" \
        component="cataloge" \
        created_by="Srikanth Chary"

ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"

COPY --from=build --chown=roboshop:roboshop /opt/server /opt/server

USER roboshop

CMD ["server.js"]

ENTRYPOINT ["node"]
