# rebase on standard node:lts-alpine
FROM node:lts-alpine
WORKDIR /app
# change volume-points into app-folder
VOLUME [ "/app/config", "/app/commands" ]
EXPOSE 3000 3001

# expose defaults to variables in docker-environment for easy customization
ARG MQTT_HOST=127.0.0.1
ARG MQTT_PORT=1833
ARG TZ=Europe/Berlin
ENV MQTT_HOST=$MQTT_HOST
ENV MQTT_PORT=$MQTT_PORT
ENV TZ=$TZ

ENV NODE_CONFIG_DIR=/app/config:/config

# add gettext and tzdata
RUN apk --update add git less openssh gettext tzdata && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
COPY package.json package.json

RUN npm install --production

COPY . .

RUN rm config/default.json
RUN mv config/docker.json config/default.json
RUN rm package-lock.json

ENTRYPOINT ["npm", "run", "production"]