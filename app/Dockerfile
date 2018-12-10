FROM node:11.1-alpine

WORKDIR /app

# hadolint ignore=DL3018
RUN apk add --update --no-cache bash jq \
  && rm -rf /var/cache/apk/*

COPY package.json .
RUN yarn

COPY app.js .

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
CMD ["node", "app.js"]
