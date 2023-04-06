ARG PHP_VERSION='8.2'

FROM aartintelligent/ops-composer:${PHP_VERSION} AS symfony-ops-composer

COPY src /src

RUN set -eux; \
composer install \
--prefer-dist \
--no-autoloader \
--no-interaction \
--no-scripts \
--no-progress \
--no-dev; \
composer dump-autoload \
--optimize

FROM aartintelligent/app-php:${PHP_VERSION}

USER root

RUN set -eux; \
rm -rf /var/www/*

COPY --chown=rootless:rootless src /var/www

COPY --chown=rootless:rootless --from=symfony-ops-composer /src/vendor /var/www/vendor

COPY --chown=rootless:rootless system /

RUN set -eux; \
echo "/docker/d-bootstrap-symfony.sh" >> /docker/d-bootstrap.list; \
chmod +x /docker/d-bootstrap-symfony.sh

USER rootless
