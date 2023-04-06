ARG PHP_VERSION='8.2'

FROM aartintelligent/ops-composer:${PHP_VERSION}

COPY d-entrypoint.sh /d-entrypoint.sh

RUN set -eux; \
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash; \
apt-get install \
symfony-cli

RUN set -eux; \
mkdir -p \
/src; \
chmod 777 -R \
/src; \
chmod +x \
/d-entrypoint.sh

WORKDIR /src

ENTRYPOINT ["/d-entrypoint.sh"]
