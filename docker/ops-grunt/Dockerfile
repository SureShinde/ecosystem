FROM debian:bullseye-slim

ARG NODE_VERSION='18'

ENV \
NODE_VERSION="${NODE_VERSION}"

RUN apt-get update \
&&  apt-get install -y --no-install-recommends \
software-properties-common \
apt-utils \
apt-transport-https \
lsb-release \
ca-certificates \
gnupg \
gnupg1 \
gnupg2 \
tini \
curl \
wget

RUN apt-get update \
&&  curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -

RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
nodejs

RUN set -eux; \
npm install -g grunt-cli

COPY d-entrypoint.sh /d-entrypoint.sh

RUN set -eux; \
mkdir -p \
/var/cache/yarn \
/src; \
chmod 777 -R \
/var/cache \
/src; \
chmod +x \
/d-entrypoint.sh

WORKDIR /src

ENTRYPOINT ["/d-entrypoint.sh"]
