FROM debian:bullseye-slim

ARG NODE_VERSION='18'

ENV \
NODE_VERSION="${NODE_VERSION}" \
YARN_CACHE_FOLDER="/var/cache/yarn"

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
&&  curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
&&  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&&  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
nodejs \
yarn

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
