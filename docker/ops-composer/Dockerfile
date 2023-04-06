ARG PHP_VERSION='8.2'

FROM aartintelligent/ops-php:${PHP_VERSION}

ENV \
COMPOSER_ALLOW_SUPERUSER="0" \
COMPOSER_ALLOW_XDEBUG="0" \
COMPOSER_CACHE_DIR="/var/cache/composer" \
COMPOSER_AUTH=""

VOLUME ["/var/cache/composer"]

COPY d-entrypoint.sh /d-entrypoint.sh

RUN wget -q https://getcomposer.org/download/latest-stable/composer.phar; \
mv composer.phar /usr/bin/composer

RUN set -eux; \
mkdir -p \
/var/cache/composer \
/src; \
chmod 777 -R \
/var/cache/composer \
/src; \
chmod +x \
/d-entrypoint.sh \
/usr/bin/composer

WORKDIR /src

ENTRYPOINT ["/d-entrypoint.sh"]
