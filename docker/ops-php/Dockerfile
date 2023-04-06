FROM debian:stable-slim

ARG PHP_VERSION='8.2'

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
wget \
patch \
unzip \
git

RUN set -eux; \
apt-get update \
&& wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN set -eux; \
apt-get update; \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
php${PHP_VERSION} \
php${PHP_VERSION}-cli \
php${PHP_VERSION}-common \
php${PHP_VERSION}-bcmath \
php${PHP_VERSION}-opcache \
php${PHP_VERSION}-apcu \
php${PHP_VERSION}-amqp \
php${PHP_VERSION}-xdebug \
php${PHP_VERSION}-oauth \
php${PHP_VERSION}-redis \
php${PHP_VERSION}-curl \
php${PHP_VERSION}-soap \
php${PHP_VERSION}-phar \
php${PHP_VERSION}-mbstring \
php${PHP_VERSION}-mysql \
php${PHP_VERSION}-sqlite3 \
php${PHP_VERSION}-xml \
php${PHP_VERSION}-xsl \
php${PHP_VERSION}-gd \
php${PHP_VERSION}-intl \
php${PHP_VERSION}-iconv \
php${PHP_VERSION}-ftp \
php${PHP_VERSION}-ldap \
php${PHP_VERSION}-zip

COPY d-entrypoint.sh /d-entrypoint.sh

RUN set -eux; \
mkdir -p \
/etc/php \
/src; \
chmod 777 -R \
/etc/php \
/src; \
chmod +x \
/d-entrypoint.sh

WORKDIR /src

ENTRYPOINT ["/d-entrypoint.sh"]
