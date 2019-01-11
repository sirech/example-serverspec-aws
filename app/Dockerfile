FROM node:11.6-alpine

WORKDIR /app

# hadolint ignore=DL3018,DL3013
RUN apk update --no-cache && \
  apk add --no-cache bash jq python py-pip && \
  pip --no-cache-dir install --upgrade pip awscli && \
  apk -v --purge del py-pip && \
  rm -rf /var/cache/apk/*

COPY package.json .
RUN yarn

COPY app.js .
COPY entrypoint.sh .

RUN adduser -D runner

USER runner
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
CMD ["node", "app.js"]
