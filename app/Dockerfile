FROM node:11.6-alpine

WORKDIR /app

# hadolint ignore=DL3018,DL3013
RUN apk update --no-cache && \
  apk add --no-cache bash jq python py-pip curl && \
  pip --no-cache-dir install --upgrade pip awscli && \
  apk -v --purge del py-pip && \
  rm -rf /var/cache/apk/*

COPY package.json .
RUN yarn

COPY app.js .
COPY entrypoint.sh /usr/sbin/entrypoint.sh

RUN adduser -D runner

USER runner
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
CMD ["node", "app.js"]
